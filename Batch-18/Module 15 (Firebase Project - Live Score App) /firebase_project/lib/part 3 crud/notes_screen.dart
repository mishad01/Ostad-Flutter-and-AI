import 'package:flutter/material.dart';
import 'package:firebase_project/part%203%20crud/model/note.dart';
import 'package:firebase_project/part%203%20crud/note_dialog.dart';
import 'package:firebase_project/part%203%20crud/service/note_service.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final NoteService _service = NoteService();

  late final Stream<List<Note>> _notesStream = _service.getNotes();

  Future<void> _openNoteDialog({Note? note}) async {
    final Map<String, String>? result = await showDialog<Map<String, String>>(
      context: context,
      builder: (dialougeContext) => NoteDialog(note: note),
    );

    if (result == null) return;

    if (note == null) {
      await _service.addNote(result['title']!, result['content']!);
    } else {
      await _service.updateNotes(note.id, result['title']!, result['content']!);
    }
  }

  Future<void> _confirmDelete(Note note) async {
    final bool? yes = await showDialog<bool>(
      context: context,
      builder: (dialougeContext) => AlertDialog(
        title: const Text('Delete Note?'),
        content: Text("${note.title} will be deleted permanently"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialougeContext).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialougeContext).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (yes == true) {
      await _service.deleteNote(note.id);
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("${note.title} deleted")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openNoteDialog(),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Note>>(
        stream: _notesStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {}
          final List<Note> notes = snapshot.data ?? [];
          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final Note note = snapshot.data![index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 0,
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.primaryContainer,
                      child: Icon(
                        Icons.note_outlined,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                    title: Text(
                      note.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        note.content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          height: 1.4,
                        ),
                      ),
                    ),
                    onTap: () => _openNoteDialog(),
                    trailing: IconButton(
                      tooltip: 'Delete note',
                      onPressed: () => _confirmDelete(note),
                      icon: const Icon(Icons.delete_outline),
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
