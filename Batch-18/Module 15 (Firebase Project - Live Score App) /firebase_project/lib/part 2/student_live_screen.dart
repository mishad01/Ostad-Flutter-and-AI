import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentLiveScreen extends StatefulWidget {
  const StudentLiveScreen({super.key});

  @override
  State<StudentLiveScreen> createState() => _StudentLiveScreenState();
}

class _StudentLiveScreenState extends State<StudentLiveScreen> {
  final TextEditingController _nameController = TextEditingController();

  final CollectionReference<Map<String, dynamic>> _students = FirebaseFirestore
      .instance
      .collection('students');

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  Future<void> _addStudent() async {
    final String name = _nameController.text.trim();
    if (name.isEmpty) return;

    await _students.add({
      'name': name,
      'age': 20,
      'isActive': true,
      'subjects': ['Math', 'English'],
      'createdAt': DateTime.now(),
    });

    _nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Live Data')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 16,
            children: [
              const Text('Live data from Firestore'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _nameController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: 'Student name',
                      hintText: 'Enter student name',
                      prefixIcon: const Icon(Icons.person_outline),
                      filled: true,
                      fillColor: Colors.grey.shade50,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                      ),
                    ),
                    onSubmitted: (_) => _addStudent(),
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: _addStudent,
                      icon: const Icon(Icons.add),
                      label: const Text(
                        'Add Student',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ),
              /*
              final CollectionReference<Map<String, dynamic>> _students = FirebaseFirestore
      .instance
      .collection('students');
               */
              Expanded(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: _students.snapshots(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: snapshot.data?.docs.length ?? 0,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primaryContainer,
                            child: Text(
                              (snapshot.data?.docs[index]['name'] ?? 'U')
                                  .toString()
                                  .substring(0, 1)
                                  .toUpperCase(),
                              style: TextStyle(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text(
                            snapshot.data?.docs[index]['name'] ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              'ID: ${snapshot.data?.docs[index].id ?? ''}  •  '
                              'Age: ${snapshot.data?.docs[index]['age'] ?? ''}',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  snapshot.data?.docs[index]['isActive'] == true
                                  ? Colors.green.withOpacity(0.12)
                                  : Colors.red.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 7,
                                  height: 7,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        snapshot
                                                .data
                                                ?.docs[index]['isActive'] ==
                                            true
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  snapshot.data?.docs[index]['isActive'] == true
                                      ? 'Active'
                                      : 'Inactive',
                                  style: TextStyle(
                                    color:
                                        snapshot
                                                .data
                                                ?.docs[index]['isActive'] ==
                                            true
                                        ? Colors.green.shade700
                                        : Colors.red.shade700,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
