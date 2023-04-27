import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class SendNotificationScreen extends StatefulWidget {
  final String title;
  final String request;
  final File file;
  final CollectionReference<Map<String, dynamic>> adminCollection;

  const SendNotificationScreen({
    Key? key,
    required this.title,
    required this.request,
    required this.file,
    required this.adminCollection,
  }) : super(key: key);

  @override
  _SendNotificationScreenState createState() => _SendNotificationScreenState();
}

class _SendNotificationScreenState extends State<SendNotificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _requestController = TextEditingController();
  bool _isLoading = false;

  Future<void> _sendNotification() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        // Upload the file to Firebase Storage
        final fileName = path.basename(widget.file.path);
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('pinext_admin')
            .child(widget.title)
            .child(fileName);
        final uploadTask = storageRef.putFile(widget.file);
        final snapshot = await uploadTask.whenComplete(() => null);

        // Get the file download URL from Firebase Storage
        final downloadUrl = await snapshot.ref.getDownloadURL();

        // Save the notification to Firestore
        final notificationData = {
          'title': _titleController.text,
          'request': _requestController.text,
          'fileUrl': downloadUrl,
        };
        await widget.adminCollection
            .doc('requested_notifications')
            .set(notificationData);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Notification sent to admin'),
            duration: const Duration(seconds: 2),
          ),
        );

        Navigator.pop(context);
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${error.toString()}'),
            duration: const Duration(seconds: 2),
          ),
        );

        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Notification'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _requestController,
                  decoration: const InputDecoration(
                    labelText: 'Request',
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Request is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _isLoading ? null : _sendNotification,
                  child: const Text('Send'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
