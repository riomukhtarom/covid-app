import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PageListPeople extends StatefulWidget {
  @override
  _PageListPeopleState createState() => _PageListPeopleState();
}

class _PageListPeopleState extends State<PageListPeople> {
  List<Widget> people = [];

  _PageListPeopleState() {
    people.add(ItemListPeople(
        image: "assets/images/pp.jpg",
        name: "Rio Mukhtarom",
        profession: "Android Dev"));

    people.add(ItemListPeople(
        image: "assets/images/pp.jpg",
        name: "Mukhtar",
        profession: "Machine Leaning Dev"));

    people.add(ItemListPeople(
        image: "assets/images/pp.jpg", name: "Mas Rio", profession: "Flutter Dev"));

    people.add(ItemListPeople(
        image: "assets/images/pp.jpg", name: "Mas Rio", profession: "Mobile Dev"));

    people.add(ItemListPeople(
        image: "assets/images/pp.jpg", name: "Mas Rio", profession: "Flutter Dev"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ini List")),
      body: Container(
        child: ListView(children: people),
      ),
    );
  }
}

class ItemListPeople extends StatelessWidget {
  ItemListPeople({this.image, this.name, this.profession});

  final String image;
  final String name;
  final String profession;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        children: <Widget>[
          Container(
            child: Image.asset(
              image,
              width: 80,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
                Text(
                  profession,
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
