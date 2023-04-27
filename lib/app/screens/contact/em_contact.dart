import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmContact extends StatefulWidget {
  const EmContact({super.key});

  @override
  State<EmContact> createState() => _EmContactState();
}

class _EmContactState extends State<EmContact> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  bool _isEditMode = false;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _fetchEmergencyContact();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _toggleEditMode() {
    setState(() {
      _isEditMode = !_isEditMode;
    });
  }

  void _fetchEmergencyContact() async {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user!.uid;

    final querySnapshot = await FirebaseFirestore.instance
        .collection('pinext_users')
        .doc(userId)
        .collection('emergency')
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final contactData = querySnapshot.docs.first.data();
      _firstNameController.text = contactData['first_name'] ?? '';
      _lastNameController.text = contactData['last_name'] ?? '';
      _phoneController.text = contactData['phone'] ?? '';
      _emailController.text = contactData['email'] ?? '';
    }
  }

  void _saveChanges() async {
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final phone = _phoneController.text;
    final email = _emailController.text;

    final user = FirebaseAuth.instance.currentUser;
    final userId = user!.uid;

    await FirebaseFirestore.instance
        .collection('pinext_users')
        .doc(userId)
        .collection('emergency')
        .add({
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'email': email,
    }).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Emergency contact added successfully!'),
        ),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add emergency contact: $error'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Emergency Contact',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.contact_emergency,
                size: 66,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.2,
              ),
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _toggleEditMode,
                    child: Text(_isEditMode ? 'Cancel' : 'Edit'),
                  ),
                  const SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: _saveChanges,
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
