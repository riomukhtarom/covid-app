
import 'dart:convert';

import 'package:http/http.dart' as http;

class Messaging {
  static final String serverToken =
      'AAAAeX2rI6Q:APA91bHWxOxTUkjo5lWI5Xf4GLFc3cC9F-fLy5tjWD9TzL8IIRVegq4tIdQJZzZ0vxnei8A5zW8D6FxT28g7AADskryjMs3qg79shjAJWsEg9vpyauQFOJ4r0cbbCyZM3NW7Xf6Qn59z';

  static void sendMessageOurDevice({String title, String body, String token}) async {

    var result = await http.post(
      'https://fcm.googleapis.com/fcm/send',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{'body': '$body', 'title': '$title'},
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
//          'to': '/topics/all',
          'to': '$token',
        },
      ),
    );

    if (result.statusCode == 200) {
      print("succes");
    } else {
      print("gagal");
    }

  }

  static void sendMessageToOther({String title, String body, String topic}) async {

    var result = await http.post(
      'https://fcm.googleapis.com/fcm/send',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{'body': '$body', 'title': '$title'},
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
          'to': '/topics/$topic',
        },
      ),
    );

    if (result.statusCode == 200) {
      print("succes");
    } else {
      print("gagal");
    }

  }

}
