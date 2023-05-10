import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pinext/app/screens/files/user_files_view.dart';

import '../../../widget/back_icon.dart';

class AddonOneScreen extends StatelessWidget {
  const AddonOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Norrenberger services',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      /*
      appBar: AppBar(
        title: const Text(
          'Addon File 01',
          style: TextStyle(
            color: Colors.black,
          ),
        ),

        // StreamBuilder<QuerySnapshot>(
        //   stream: FirebaseFirestore.instance
        //       .collection('pinext_users')
        //       .doc(FirebaseAuth.instance.currentUser!.uid)
        //       .collection('files')
        //       .snapshots(),
        //   builder: (context, snapshot) {
        //     final fileCount = snapshot.hasData ? snapshot.data!.size : 0;
        //     return Text(
        //       'User Files ($fileCount)',
        //       style: const TextStyle(
        //         color: Colors.black,
        //       ),
        //     );
        //   },
        // ),
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.list_alt_outlined,
        //       color: Colors.black,
        //     ),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => UserFilesListScreen(),
        //         ),
        //       );
        //     },
        //   ),
        // ],
      ),
      */



      body: ListView.builder(
        itemCount: 1, // set the number of items to 5
        itemBuilder: (context, index) {
          return AddonOneUploadMania(index: index);
        },
      ),
    );
  }
}

class AddonOneUploadMania extends StatefulWidget {
  final int index;

  const AddonOneUploadMania({Key? key, required this.index}) : super(key: key);

  @override
  _AddonOneUploadManiaState createState() => _AddonOneUploadManiaState();
}

class _AddonOneUploadManiaState extends State<AddonOneUploadMania> {
  late File _file;
  bool _isUploading = false;
  String _fileName = '';

  Future<void> _sendNotification() async {
    // Get the current user's ID
    final userId = FirebaseAuth.instance.currentUser!.uid;

    // Create a reference to the "pinext_admin" collection
    final adminCollection =
        FirebaseFirestore.instance.collection('pinext_admin');

    // Create a reference to the "notification" subcollection
    final notificationCollection =
        adminCollection.doc(userId).collection('addons_notification');

    // Check if the "notification" subcollection exists
    final snapshot = await notificationCollection.limit(1).get();
    if (snapshot.size == 0) {
      // If the subcollection doesn't exist, create it
      await adminCollection.doc(userId).set({});
    }

    // Create a document in the "notification" subcollection with the title and file URL
    final notificationData = {
      'title': userId + ' Requested for addon 01',
      'sendfile': _fileName,
    };
    await notificationCollection.add(notificationData);

    // Show a snackbar to confirm that the notification was sent
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notification sent to admin'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> _downloadFile() async {
    try {
      setState(() {
        _isUploading = true;
      });

      // Get the current user's ID
      final userId = FirebaseAuth.instance.currentUser!.uid;

      // Create a reference to the "pinext_admin" collection
      final adminCollection =
          FirebaseFirestore.instance.collection('pinext_admin');

      // Create a reference to the "addons_files" subcollection for the current user
      final filesCollection =
          adminCollection.doc(userId).collection('addons_files');

      // Query the "addons_files" subcollection for the file you want to download
      final querySnapshot = await filesCollection.limit(1).get();
      final fileDoc = querySnapshot.docs.first;
      final fileUrl = fileDoc.get('fileUrl');

      // Get the file download URL from Firebase Storage
      final storageRef = FirebaseStorage.instance.refFromURL(fileUrl);
      final fileName =
          'user_file_${widget.index.toString().padLeft(2, '0')}.pdf';
      final fileData = await storageRef.getData();
      final fileBytes =
          List<int>.from(fileData!); // Convert Uint8List to List<int>
      final filePath = await File('$fileName').writeAsBytes(fileBytes);

      // Show a snackbar to confirm that the file was downloaded
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('File downloaded successfully'),
          duration: Duration(seconds: 2),
        ),
      );

      setState(() {
        _isUploading = false;
        _fileName = fileName;
      });
    } catch (e) {
      print('Error downloading file: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error downloading file'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Service 01 name goes here',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _fileName.isNotEmpty
                            ? _fileName
                            : 'Your requested service report file will appear here when ready.',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _sendNotification,
                child: const Text(
                  'Request service',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
                ),
                onPressed: _downloadFile,
                child: const Text(
                  'Download',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        if (_isUploading)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
