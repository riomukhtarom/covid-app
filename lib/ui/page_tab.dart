import 'package:aplikasi/list/page_api.dart' as listCorona;
import 'package:aplikasi/model/model_countries.dart';
import 'package:aplikasi/ui/page_alert.dart';
import 'package:aplikasi/ui/page_login.dart';
import 'package:aplikasi/ui/page_profile.dart';
import 'package:aplikasi/ui/page_setting.dart';
import 'package:flutter/material.dart';

class PageTab extends StatefulWidget {
  final Future<List<Countries>> country;

  PageTab({Key key, this.country}) : super(key: key);

  @override
  _PageTabState createState() => _PageTabState(country: country);
}

class _PageTabState extends State<PageTab> with SingleTickerProviderStateMixin {
  TabController controller;
  final Future<List<Countries>> country;

  _PageTabState({this.country});

  @override
  void initState() {
    controller = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab Bar"),
        leading: Icon(
          Icons.adb,
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageSetting()),
                );
              }),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageLogin()),
              );
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff0096ff),
                Color(0xff6610f2),
              ],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
        // bottom: TabBar(
        //   controller: controller,
        //   tabs: <Widget>[
        //     Tab(icon: Icon(Icons.people)),
        //     Tab(icon: Icon(Icons.list)),
        //   ],
        // ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          PageProfile(),
          listCorona.ListCorona(country: country),
          PageAlert(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          controller: controller,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: Colors.lightBlue,
            border: Border(
              top: BorderSide(color: Colors.red, width: 2),
            ),
          ),
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.person),
              // text: "Profil",
            ),
            Tab(
              icon: Icon(Icons.list),
              // text: "List",
            ),
            Tab(
              icon: Icon(Icons.warning),
              // text: "List",
            ),
          ],
        ),
      ),
    );
  }
}