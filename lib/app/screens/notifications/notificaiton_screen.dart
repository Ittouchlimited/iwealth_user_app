import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  final String userId;

  const NotificationScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int _unreadNotificationsCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Notifications 🔔',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('pinext_users')
            .doc(widget.userId)
            .collection('notifications')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          List<Widget> notificationCards = [];

          _unreadNotificationsCount = 0;

          snapshot.data!.docs.forEach((notificationDoc) {
            String title = notificationDoc.get('title');
            String message = notificationDoc.get('message');
            Timestamp timestamp = notificationDoc.get('timestamp');

            notificationCards.add(
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: Colors.amberAccent,
                    size: 40,
                  ),
                  title: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4.0),
                      Text(
                        message,
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        timestamp.toDate().toString(),
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: Text('Delete Notification'),
                            content: Text(
                                'Are you sure you want to delete this notification?'),
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
                                  notificationDoc.reference.delete();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            );

            notificationCards.add(
              SizedBox(height: 8.0),
            );
          });

          if (notificationCards.isEmpty) {
            return Center(
              child: Text(
                'No notifications yet',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(children: notificationCards),
            ),
          );
        },
      ),
    );
  }
}
