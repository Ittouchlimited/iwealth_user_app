import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
          title: Text('Delete file?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete this file?'),
              ],
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('Delete'),
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
        title: Text('Uploaded Files'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

          if (documents.isEmpty) {
            return Center(
              child: Text('No files uploaded'),
            );
          }

          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            itemCount: documents.length,
            separatorBuilder: (context, index) => SizedBox(height: 16),
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
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                fileName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
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
                          icon: Icon(Icons.download_for_offline_sharp),
                          color: Colors.green,
                          onPressed: () async {
                            await launch(url);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete_forever),
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
