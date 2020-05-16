import 'dart:convert';
import 'package:aplikasi/model/model_user.dart';
import 'package:aplikasi/model/model_user_result.dart';
import 'package:http/http.dart' as http;

class ApiReqres {
  String baseUrl = "https://reqres.in/";

  String getBaseUrl() {
    return this.baseUrl;
  }

  static Future<UserResult> postUser(String name, String job) async {
    // Endpoint 
    // /api/users

    // Request
    // {
    //     "name": "morpheus",
    //     "job": "leader"
    // }
    
    // Response 201
    // {
    //     "name": "morpheus",
    //     "job": "leader",
    //     "id": "447",
    //     "createdAt": "2020-04-24T03:12:32.344Z"
    // }

    String url = "https://reqres.in/api/users";

    var result = await http.post(url, body: {"name": name, "job": job});
    
    if (result.statusCode == 201) {
      var jsonObject = json.decode(result.body);
      return UserResult.toUserResult(jsonObject);

    } else {
      throw Exception('failed');
    }
  }

  static Future<User> getUser(String id) async{
    // Endpoint 
    // /api/users/{id}

    // Response 200
    // {
    //     "data": {
    //         "id": 2,
    //         "email": "janet.weaver@reqres.in",
    //         "first_name": "Janet",
    //         "last_name": "Weaver",
    //         "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg"
    //     },
    //     "ad": {
    //         "company": "StatusCode Weekly",
    //         "url": "http://statuscode.org/",
    //         "text": "A weekly newsletter focusing on software development, infrastructure, the server, performance, and the stack end of things."
    //     }
    // }

    String url = "https://reqres.in/api/users/" + id;

    var result = await http.get(url);
    if (result.statusCode == 200) {
      var resultObject = json.decode(result.body);
      var userObject = (resultObject as Map<String, dynamic>)['data'];
      return User.toUser(userObject);

    } else {
      throw Exception('failed');
    }
    
  }

  static Future<List<User>> getListUsers(String page) async {
    // Endpoint
    // /api/users?page={page_number}

    // Response 200
    // {
    //     "page": 2,
    //     "per_page": 6,
    //     "total": 12,
    //     "total_pages": 2,
    //     "data": [
    //         {
    //             "id": 7,
    //             "email": "michael.lawson@reqres.in",
    //             "first_name": "Michael",
    //             "last_name": "Lawson",
    //             "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/follettkyle/128.jpg"
    //         },
    //         {
    //             "id": 8,
    //             "email": "lindsay.ferguson@reqres.in",
    //             "first_name": "Lindsay",
    //             "last_name": "Ferguson",
    //             "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/araa3185/128.jpg"
    //         },
    //     ],
    //     "ad": {
    //         "company": "StatusCode Weekly",
    //         "url": "http://statuscode.org/",
    //         "text": "A weekly newsletter focusing on software development, infrastructure, the server, performance, and the stack end of things."
    //     }
    // }

    String url = "https://reqres.in/api/users?page=" + page;

    var result = await http.get(url);
    if (result.statusCode == 200) {
      var resultObject = json.decode(result.body);
      List<dynamic> listObject = (resultObject as Map<String, dynamic>)['data'];
      List<User> users = [];
      for (var i = 0; i < listObject.length; i++) {
        users.add(User.toUser(listObject[i]));
      }
      return users;
      
    } else {
      throw Exception('failed');
    }

  }
}