import 'package:aplikasi/api/messaging.dart';
import 'package:aplikasi/model/model_message.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotifApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageNotif(),
    );
  }
}

class PageNotif extends StatefulWidget {
  @override
  _PageNotifState createState() => _PageNotifState();
}

class _PageNotifState extends State<PageNotif> {
  String _homeScreenText = "Waiting for token...";
  String _messageText = "Waiting for message...";
  String _fcmToken = "";

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Message> messages = [];
  final TextEditingController titleController =
      TextEditingController(text: "Title");
  final TextEditingController bodyController =
      TextEditingController(text: "Body ini");
  final Messaging messaging = Messaging();

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.subscribeToTopic('all');

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        final notification = message['notification'];
        setState(() {
          messages.add(Message(
            title: notification['title'],
            body: notification['body'],
          ));

          AlertDialog alertDialog = AlertDialog(
            title: Text(notification['title']),
            content: Text(notification['body']),
          );

          showDialog(context: context, child: alertDialog);
        });
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        final notification = message['notification'];
        setState(() {
          messages.add(Message(
            title: notification['title'],
            body: notification['body'],
          ));
        });
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        final notification = message['notification'];
        setState(() {
          messages.add(Message(
            title: notification['title'],
            body: notification['body'],
          ));
        });
      },
    );

    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));

    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });

    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      setState(() {
        _homeScreenText = "Push Messaging token: $token";
        _fcmToken = token;
      });
      print(_homeScreenText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Push Messaging Demo'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Center(
              child: Text(
                _homeScreenText,
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextFormField(
              controller: bodyController,
              decoration: InputDecoration(labelText: "Body"),
            ),
            RaisedButton(
              onPressed: () async {
                Messaging.sendMessageOurDevice(
                  title: titleController.text,
                  body: bodyController.text,
                  token: _fcmToken,
                );
              },
              child: Text("Send"),
            ),
            RaisedButton(
              onPressed: () async {
                Messaging.sendMessageToOther(
                  title: titleController.text,
                  body: bodyController.text,
                  topic: "all"
                );
              },
              child: Text("Send To All"),
            ),
          ]..addAll(messages.map(buildMessage).toList()),
        ),
      ),
    );
  }

  Widget buildMessage(Message e) => ListTile(
        title: Text(e.title),
        subtitle: Text(e.body),
      );
}
