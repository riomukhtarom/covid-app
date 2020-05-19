import 'package:aplikasi/bloc/user_bloc.dart';
import 'package:aplikasi/ui/page_favorite.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi/list/page_list_people.dart' as listPeople;
import 'package:flutter_bloc/flutter_bloc.dart';

class PageProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Ini Aplikasi")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: <Widget>[
                // photo
                Container(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Hero(
                    tag: 'rio',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Container(
                        child:
                            Image.asset("assets/images/pp.jpg", width: 150.0),
                      ),
                    ),
                  ),
                ),
                // name
                Container(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text(
                    "Rio Mukhtarom",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Job
                Container(
                  padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                  child: Text(
                    "Mobile Developer",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                // Icon
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => UserBloc(),
                                child: PageFavorite(),
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 36.0,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.message,
                          size: 36.0,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.call,
                          size: 36.0,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                // Gender
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(2),
                        child: Icon(
                          Icons.beach_access,
                          size: 24.0,
                          color: Colors.blue,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        child: Text(
                          "Laki-laki",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                // Address
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(2),
                        child: Icon(
                          Icons.home,
                          size: 24.0,
                          color: Colors.blue,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        child: Text(
                          "Jl. Paccerakang No. 152",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                // Age
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(2),
                        child: Icon(
                          Icons.date_range,
                          size: 24.0,
                          color: Colors.blue,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        child: Text(
                          "22 years old",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                // Desc
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(2),
                        child: Icon(
                          Icons.content_paste,
                          size: 24.0,
                          color: Colors.blue,
                        ),
                      ),
                      Container(
                        width: 300.0,
                        padding: EdgeInsets.all(2),
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          maxLines: 5,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),

                // Button
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          "Detail",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      listPeople.PageListPeople()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
