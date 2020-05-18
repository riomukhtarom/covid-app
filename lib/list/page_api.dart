import 'package:aplikasi/model/model_countries.dart';
import 'package:aplikasi/ui/page_login.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi/my_lib.dart' as lib;
import 'dart:async';

class ListCorona extends StatefulWidget {
  final Future<List<Countries>> country;

  ListCorona({Key key, this.country}) : super(key: key);

  @override
  _ListCoronaState createState() => _ListCoronaState(country: country);
}

class _ListCoronaState extends State<ListCorona> {
  final Future<List<Countries>> country;

  _ListCoronaState({Key key, this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder<List<Countries>>(
        future: country,
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? CountryList(items: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      )),
    );
  }
}

class CountryList extends StatelessWidget {
  final List<Countries> items;

  CountryList({Key key, this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ItemCountry(country: items[index]
//          onTap: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => PageLogin()),
//            );
//          },
            );
      },
    );
  }
}

class ItemCountry extends StatelessWidget {
  final Countries country;

  ItemCountry({Key key, this.country});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.amber,
                child: lib.MyText(text: country.name),
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  lib.MyText(text: country.confirmed),
                  lib.MyText(text: country.deaths),
                  lib.MyText(text: country.recovered),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
