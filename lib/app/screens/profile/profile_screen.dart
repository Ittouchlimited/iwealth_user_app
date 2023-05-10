import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../app_data/app_constants/fonts.dart';
import '../../app_data/routing/routes.dart';
import '../../bloc/userBloc/user_bloc.dart';
import '../../models/pinext_user_model.dart';

class PinextUsersScreen extends StatelessWidget {
  final String currentUserId;
  String _imageUrl = '';

  PinextUsersScreen({required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Data',
          style: GoogleFonts.openSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff4F62C1),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('pinext_users')
            .where('userId', isEqualTo: currentUserId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData) {
            return Center(
                child: Text(
              'Loading...',
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ));
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final document = snapshot.data!.docs[index];
              final userModel = PinextUserModel.fromMap(
                  document.data() as Map<String, dynamic>);

              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            EditPinextUserScreen(userModel: userModel),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: _imageUrl.isEmpty
                                ? null
                                : NetworkImage(_imageUrl),
                            child: _imageUrl.isEmpty
                                ? const Icon(
                                    Icons.account_circle,
                                    size: 100,
                                    color: Colors.grey,
                                  )
                                : null,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          userModel.username,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          userModel.emailAddress,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Net Balance:',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              userModel.netBalance,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: userModel.netBalance.startsWith('-')
                                    ? Colors.red
                                    : Colors.green,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        /*
                        SizedBox(height: 8),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Monthly Budget:',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              userModel.monthlyBudget,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: userModel.monthlyBudget.startsWith('-')
                                    ? Colors.red
                                    : Colors.green,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        */
                        /*
                        SizedBox(height: 8),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Monthly Expenses:',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              userModel.monthlyExpenses,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: userModel.monthlyExpenses.startsWith('-')
                                    ? Colors.red
                                    : Colors.green,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        */
                        /*
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Daily Expenses:',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              userModel.dailyExpenses,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: userModel.dailyExpenses.startsWith('-')
                                    ? Colors.red
                                    : Colors.green,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        */
                        /*
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Weekly Expenses:',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              userModel.weeklyExpenses,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: userModel.weeklyExpenses.startsWith('-')
                                    ? Colors.red
                                    : Colors.green,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        */
                        /*
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Monthly Savings:',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              userModel.monthlySavings,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: userModel.monthlySavings.startsWith('-')
                                    ? Colors.red
                                    : Colors.green,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        */
                        /*
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Account Created:',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              userModel.accountCreatedOn,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    userModel.accountCreatedOn.startsWith('-')
                                        ? Colors.red
                                        : Colors.green,
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                        */
                        /*
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Current Month:',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              userModel.currentMonth,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: userModel.currentMonth.startsWith('-')
                                    ? Colors.red
                                    : Colors.green,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        */
                        SizedBox(height: 8),

                        /*
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Current Year:',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              userModel.currentYear,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: userModel.currentYear.startsWith('-')
                                    ? Colors.red
                                    : Colors.green,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        */



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

class EditPinextUserScreen extends StatefulWidget {
  final PinextUserModel userModel;

  EditPinextUserScreen({required this.userModel});

  @override
  _EditPinextUserScreenState createState() => _EditPinextUserScreenState();
}

class _EditPinextUserScreenState extends State<EditPinextUserScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _netBalanceController;
  late TextEditingController _monthlyBudgetController;
  late TextEditingController _monthlyExpensesController;
  late TextEditingController _dailyExpensesController;
  late TextEditingController _weeklyExpensesController;
  late TextEditingController _monthlySavingsController;
  final ImagePicker _picker = ImagePicker();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final User? _user = FirebaseAuth.instance.currentUser;
  String _imageUrl = '';
  File? _imageFile;
  bool _isLoading = false;

  Future<void> _getImageUrl() async {
    final String userId = _user!.uid;
    final Reference ref = _storage.ref().child('pinext_users/$userId/profile');
    try {
      final String url = await ref.getDownloadURL();
      setState(() {
        _imageUrl = url;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _uploadImage(File file) async {
    final String userId = _user!.uid;
    final Reference ref = _storage.ref().child('pinext_users/$userId/profile');
    final UploadTask uploadTask = ref.putFile(file);
    final TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
    final String url = await snapshot.ref.getDownloadURL();
    await _firestore
        .collection('pinext_users')
        .doc(userId)
        .update({'imageUrl': url});
    setState(() {
      _imageUrl = url;
    });
  }

  Future<void> _getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      await _uploadImage(File(image.path));
    }
  }

  @override
  void initState() {
    super.initState();
    _usernameController =
        TextEditingController(text: widget.userModel.username);
    _emailController =
        TextEditingController(text: widget.userModel.emailAddress);
    _netBalanceController =
        TextEditingController(text: widget.userModel.netBalance);
    _monthlyBudgetController =
        TextEditingController(text: widget.userModel.monthlyBudget);
    _monthlyExpensesController =
        TextEditingController(text: widget.userModel.monthlyExpenses);
    _dailyExpensesController =
        TextEditingController(text: widget.userModel.dailyExpenses);
    _weeklyExpensesController =
        TextEditingController(text: widget.userModel.weeklyExpenses);
    _monthlySavingsController =
        TextEditingController(text: widget.userModel.monthlySavings);
    _getImageUrl();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _netBalanceController.dispose();
    _monthlyBudgetController.dispose();
    _monthlyExpensesController.dispose();
    _dailyExpensesController.dispose();
    _weeklyExpensesController.dispose();
    _monthlySavingsController.dispose();
    super.dispose();
  }

  Future<void> _updateUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance
            .collection('pinext_users')
            .doc(widget.userModel.userId)
            .update({
          'username': _usernameController.text,
          'emailAddress': _emailController.text,
          'netBalance': _netBalanceController.text,
          'monthlyBudget': _monthlyBudgetController.text,
          'monthlyExpenses': _monthlyExpensesController.text,
          'dailyExpenses': _dailyExpensesController.text,
          'weeklyExpenses': _weeklyExpensesController.text,
          'monthlySavings': _monthlySavingsController.text,
        });
        Navigator.of(context).pop();
      } catch (e) {
        print('Error updating user: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update user')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // add your functionality here
            },
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocListener<UserBloc, UserState>(
                  listener: (context, state) {
                    if (state is UnauthenticatedUserState) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        ROUTES.getLoginRoute,
                        (route) => false,
                      );
                    }
                  },
                  child: GestureDetector(
                    onTap: () async {
                      final confirmLogout = await showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text('Confirm Logout'),
                            content: Text('Are you sure you want to log out?'),
                            actions: [
                              CupertinoDialogAction(
                                child: Text('Cancel'),
                                onPressed: () => Navigator.pop(context, false),
                              ),
                              CupertinoDialogAction(
                                child: Text('Logout'),
                                onPressed: () => Navigator.pop(context, true),
                              ),
                            ],
                          );
                        },
                      );
                      if (confirmLogout == true) {
                        context.read<UserBloc>().add(
                              SignOutUserEvent(context: context),
                            );
                      }
                    },
                    child: Icon(
                      Icons.logout,
                      color: Colors.redAccent[400],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
        title: Text(
          'Edit Profile',
          style: GoogleFonts.openSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff4F62C1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.camera_alt),
                          title: const Text('Take a picture'),
                          onTap: () {
                            Navigator.pop(context);
                            _getImage(ImageSource.camera);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.photo),
                          title: const Text('Select from gallery'),
                          onTap: () {
                            Navigator.pop(context);
                            _getImage(ImageSource.gallery);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    _imageUrl.isEmpty ? null : NetworkImage(_imageUrl),
                child: _imageUrl.isEmpty
                    ? const Icon(
                        Icons.account_circle,
                        size: 100,
                        color: Colors.grey,
                      )
                    : null,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        if (state is AuthenticatedUserState) {
                          return Text(
                            "Balance: ${state.netBalance} ₦",
                            style: boldTextStyle.copyWith(
                              fontSize: 25,
                            ),
                          );
                        }
                        return Text(
                          "Loading...",
                          style: boldTextStyle.copyWith(
                            fontSize: 20,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      'ID: ${_user!.uid}',
                      style: boldTextStyle.copyWith(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 28.0),
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a username.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Email Address',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email address.';
                        }
                        return null;
                      },
                    ),
                    /*
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _netBalanceController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Net Balance',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a net balance.';
                        }
                        return null;
                      },
                    ),
                    */

                    /*
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _monthlyBudgetController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Monthly Budget',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a monthly budget.';
                        }
                        return null;
                      },
                    ),
                    */
                  /*
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _monthlyExpensesController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Monthly Expenses',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter monthly expenses.';
                        }
                        return null;
                      },
                    ),
                    */
                    /*
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _dailyExpensesController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Daily Expenses',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter daily expenses.';
                        }
                        return null;
                      },
                    ),
                    */
                    /*
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _weeklyExpensesController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Weekly Expenses',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter weekly expenses.';
                        }
                        return null;
                      },
                    ),
                    */
                  /*
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _monthlySavingsController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Monthly Savings',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter monthly savings.';
                        }
                        return null;
                      },
                    ),
                    */
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child:
                          _isLoading // Conditionally render the progress indicator or the button
                              ? const CircularProgressIndicator()
                              : ElevatedButton(
                                  onPressed: () => _updateUser(context),
                                  child: const Text('Update'),
                                ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
