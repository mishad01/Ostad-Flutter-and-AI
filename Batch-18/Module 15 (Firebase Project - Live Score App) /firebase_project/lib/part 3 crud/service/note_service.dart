import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/part%203%20crud/model/note.dart';

class NoteService {
  final CollectionReference<Map<String, dynamic>> _notes = FirebaseFirestore
      .instance
      .collection('notes');

  //Create -> Post/Add
  Future<void> addNote(String title, String content) async {
    await _notes.add({
      'title': title,
      'content': content,
      'createdAt': DateTime.now(),
    });
  }

  //Get -> Read
  Stream<List<Note>> getNotes() {
    return _notes.snapshots().map(
      (snapshot) => snapshot.docs.map((doc) => Note.fromDoc(doc)).toList(),
    );
  }

  //Update - Put
  Future<void> updateNotes(String id, String title, String content) async {
    await _notes.doc(id).update({
      'title': title,
      'content': content,
      'createdAt': DateTime.now(),
    });
  }

  //Delete
  Future<void> deleteNote(String id) async {
    await _notes.doc(id).delete();
  }
}
