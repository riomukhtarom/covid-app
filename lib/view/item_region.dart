import 'package:flutter/material.dart';

class ItemRegion extends StatelessWidget {
  ItemRegion({this.name = '', this.confirmed = '', this.deaths = '', this.recovered = ''});

  final String name;
  final String confirmed;
  final String deaths;
  final String recovered;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.blue)),
        padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
        margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.add_circle_outline,
                          size: 32,
                          color: Colors.amber,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Positif',
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              confirmed,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.clear,
                          size: 32,
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Meninggal',
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              deaths,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.done,
                          size: 32,
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Sembuh',
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              recovered,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}