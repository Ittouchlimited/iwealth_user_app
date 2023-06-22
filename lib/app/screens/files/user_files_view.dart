import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';
//import 'package:permission_handler/permission_handler.dart';


class UserFilesListScreen extends StatefulWidget {
  const UserFilesListScreen({Key? key}) : super(key: key);

  @override
  State<UserFilesListScreen> createState() => _UserFilesListScreenState();
}

class _UserFilesListScreenState extends State<UserFilesListScreen> {
  Future<void> _showDeleteFileDialog(QueryDocumentSnapshot document) async {
    return showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Delete file?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure you want to delete this file?'),
              ],
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: const Text('Delete'),
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('pinext_users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('files')
                    .doc(document.id)
                    .delete();
                Navigator.of(context).pop();
              },
              isDestructiveAction: true,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Uploaded Files'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('pinext_users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('files')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

          if (documents.isEmpty) {
            return const Center(
              child: Text('No files uploaded'),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            itemCount: documents.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final document = documents[index];
              final data = document.data() as Map<String, dynamic>;
              final url = data['url'] as String;
              final fileName = document.id;
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: () async {
                    await launch(url);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                fileName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                url,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.download_for_offline_sharp),
                          color: Colors.green,
                          onPressed: () async {
                            await launch(url);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_forever),
                          color: Colors.red,
                          onPressed: () {
                            _showDeleteFileDialog(document);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
