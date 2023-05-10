import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pinext/app/screens/files/user_files_view.dart';

import 'package:permission_handler/permission_handler.dart';

class UserFilesScreen extends StatelessWidget {
  const UserFilesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        title: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('pinext_users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('files')
              .snapshots(),
          builder: (context, snapshot) {
            final fileCount = snapshot.hasData ? snapshot.data!.size : 0;

            return Text(
              'Your Deposited Files ($fileCount)',
              style: const TextStyle(
                color: Colors.black,
              ),
            );

          },
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.list_alt_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserFilesListScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 1, // set the number of items to 5
        itemBuilder: (context, index) {
          return UploadMania(index: index);
        },
      ),
    );
  }
}

class UploadMania extends StatefulWidget {
  final int index;

  const UploadMania({Key? key, required this.index}) : super(key: key);

  @override
  _UploadManiaState createState() => _UploadManiaState();
}

class _UploadManiaState extends State<UploadMania> {
  late File _file;
  bool _isUploading = false;
  String _fileName = '';

  @override
  void initState() {
    super.initState();
    _file = File('');
    // Check if the user has uploaded 5 files and disable the 'Choose File' button
    FirebaseFirestore.instance
        .collection('pinext_users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('files')
        .get()
        .then((querySnapshot) {
      if (querySnapshot.size >= 5) {
        setState(() {
          _fileName = 'You have uploaded the maximum number of files';
        });
      }
    });
  }

  Future<void> _uploadFile() async {
    setState(() {
      _isUploading = true;
    });

    if (_file == null) {
      setState(() {
        _fileName = 'Please choose a file';
        _isUploading = false;
      });
      return;
    }

    final ref = FirebaseStorage.instance.ref().child(
        'pinext_users/${FirebaseAuth.instance.currentUser!.uid}/files/$_fileName');

    if (!_file.existsSync()) {
      setState(() {
        _fileName = 'Unable to upload file';
        _isUploading = false;
      });
      return;
    }

    try {
      await ref.putFile(_file);
      final downloadUrl = await ref.getDownloadURL();
      await FirebaseFirestore.instance
          .collection('pinext_users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('files')
          .doc(_fileName)
          .set({'url': downloadUrl});

      setState(() {
        _isUploading = false;
        _fileName = ''; // clear the file name after upload
      });
    } catch (e) {
      setState(() {
        _fileName = 'Error uploading file';
        _isUploading = false;
      });
    }
  }

  Future<void> _pickFile() async {
    if (_fileName == 'You have uploaded the maximum number of files') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('You have already uploaded the maximum number of files'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null && result.files.isNotEmpty) {
      final path = result.files.first.path!;
      _file = File(path);
      _fileName = path.split('/').last;
      setState(() {});
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
                'Upload File',
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
                    const Icon(Icons.upload_file),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        _fileName.isNotEmpty
                            ? _fileName
                            : 'Choose a file to upload',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
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
               // onPressed:
                  //bool req = await Permission.storage.request().isGranted;
                  //print(req);

                onPressed: _isUploading ||
                        _fileName
                            .isNotEmpty // disable the 'Choose File' button once a file is selected
                    ? null
                    : () {
                        _pickFile();
                      },
                child: const Text('Choose File'),
              ),
              ElevatedButton(
                onPressed: _isUploading || _fileName.isEmpty
                    ? null
                    : () {
                        _uploadFile();
                      },
                child: const Text('Upload'),
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
