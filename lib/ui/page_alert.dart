import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../my_lib.dart' as lib;

class PageAlert extends StatefulWidget {
  @override
  _PageAlertState createState() => _PageAlertState();
}

class _PageAlertState extends State<PageAlert> {
  String txt = "";

  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  TextEditingController controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              // TextField
              Container(
                child: TextField(
                  decoration: InputDecoration(hintText: "Nama Anda"),
                  onChanged: (String str) {
                    setState(() {
                      txt = str;
                    });
                  },
                ),
              ),

              // Text
              Container(
                child: lib.MyText(
                  text: txt,
                ),
              ),

              // Alert
              Container(
                  child: lib.MyText(
                text: "Ini Alert",
                size: 20.0,
              )),

              Container(
                child: RaisedButton(
                  color: Colors.blue,
                  child: lib.MyText(
                    text: "Alert",
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      AlertDialog alertDialog = AlertDialog(
                        content: lib.MyText(
                          text: "Ini Alert",
                        ),
                      );
                      showDialog(context: context, child: alertDialog);
                    });
                  },
                ),
              ),

              // Snackbar
              Container(
                  child: lib.MyText(
                text: "Ini SnackBar",
                size: 20.0,
              )),
              Container(
                child: RaisedButton(
                  color: Colors.blue,
                  child: lib.MyText(
                    text: "SnackBar",
                    color: Colors.white,
                  ),
                  onPressed: () {
                    SnackBar snackBar = SnackBar(
                      content: lib.MyText(
                        text: "Ini Snackbar",
                      ),
                    );
                    _scaffoldState.currentState.showSnackBar(snackBar);
                  },
                ),
              ),

              // Toast
              Container(
                  child: lib.MyText(
                text: "Ini Toast",
                size: 20.0,
              )),
              Container(
                child: RaisedButton(
                  color: Colors.blue,
                  child: lib.MyText(
                    text: "Toast",
                    color: Colors.white,
                  ),
                  onPressed: () {

                  },
                ),
              ),

              // TextField
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: TextField(
                  controller: controller,
                  obscureText: false,
                  maxLength: 10,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.lightBlue[50],
                    filled: true,
                    icon: Icon(Icons.people),
                    prefixIcon: Icon(Icons.access_time),
//                    prefixText: "Name",
                    suffix: Container(width: 5, height: 5, color: Colors.red,),
                    hintText: "Mukhtar R",
                    labelText: "Nama Lengkap",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              // Text
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: lib.MyText(text: controller.text, size: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
