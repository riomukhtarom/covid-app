import 'package:aplikasi/bloc/country_bloc.dart';
import 'package:aplikasi/model/model_country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageStatisticCovid extends StatelessWidget {
  final String confirmed = '0';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Kasus COVID19',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'INDONESIA',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.add_circle_outline,
                      size: 80,
                      color: Colors.amber,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Positif',
                          style: TextStyle(fontSize: 18),
                        ),
                        BlocBuilder<CountryBloc, Country>(
                            builder: (context, country) {
                          if (country is CountryUninitialized) {
                            debugPrint('Show loading data Country');
                            return Container(
                              padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                              height: 60,
                              child: Center(
                                child: SizedBox(
                                  child: CircularProgressIndicator(),
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            );
                          } else if (country is CountryError) {
                            debugPrint('Show error data Country');
                            return Text(
                              '-',
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.amber,
                              ),
                            );
                          } else {
                            if (country.country.isNotEmpty) {
                              debugPrint('Show update data Country');
                              return Text(
                                country.confirm,
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.amber,
                                ),
                              );
                            } else {
                              debugPrint('Show no data');
                              return Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.amber,
                                ),
                              );
                            }
                          }
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.clear,
                      size: 80,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Meninggal',
                          style: TextStyle(fontSize: 18),
                        ),
                        BlocBuilder<CountryBloc, Country>(
                            builder: (context, country) {
                          if (country is CountryUninitialized) {
                            debugPrint('Show loading data Country');
                            return Container(
                              padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                              height: 60,
                              child: Center(
                                child: SizedBox(
                                  child: CircularProgressIndicator(),
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            );
                          } else if (country is CountryError) {
                            debugPrint('Show error data Country');
                            return Text(
                              '-',
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.red,
                              ),
                            );
                          } else {
                            if (country.country.isNotEmpty) {
                              debugPrint('Show update data Country');
                              return Text(
                                country.deaths,
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.red,
                                ),
                              );
                            } else {
                              debugPrint('Show no data');
                              return Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.red,
                                ),
                              );
                            }
                          }
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.done,
                      size: 80,
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sembuh',
                          style: TextStyle(fontSize: 18),
                        ),
                        BlocBuilder<CountryBloc, Country>(
                            builder: (context, country) {
                          if (country is CountryUninitialized) {
                            debugPrint('Show loading data Country');
                            return Container(
                              padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                              height: 60,
                              child: Center(
                                child: SizedBox(
                                  child: CircularProgressIndicator(),
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            );
                          } else if (country is CountryError) {
                            debugPrint('Show error data Country');
                            return Text(
                              '-',
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.green,
                              ),
                            );
                          } else {
                            if (country.country.isNotEmpty) {
                              debugPrint('Show update data Country');
                              return Text(
                                country.recovered,
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.green,
                                ),
                              );
                            } else {
                              debugPrint('Show no data');
                              return Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.green,
                                ),
                              );
                            }
                          }
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
