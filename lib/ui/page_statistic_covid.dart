import 'package:aplikasi/bloc/country_bloc.dart';
import 'package:aplikasi/model/model_country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageStatisticCovid extends StatelessWidget {

  final String confirmed = '0';

  @override
  Widget build(BuildContext context) {
    CountryBloc bloc = BlocProvider.of<CountryBloc>(context);
//    bloc.dispatch('indonesia');
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
                          if (country.country != null) {
                            debugPrint('Show update data');
                            return Text(
                              country.confirm,
                              style: TextStyle(
                                fontSize: 46,
                                color: Colors.amber,
                              ),
                            );
                          } else {
                            debugPrint('Show no data');
                            return Text(
                              '000000',
                              style: TextStyle(
                                fontSize: 46,
                                color: Colors.amber,
                              ),
                            );
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
                              if (country.country != null) {
                                debugPrint('Show update data');
                                return Text(
                                  country.deaths,
                                  style: TextStyle(
                                    fontSize: 46,
                                    color: Colors.red,
                                  ),
                                );
                              } else {
                                debugPrint('Show no data');
                                return Text(
                                  '000000',
                                  style: TextStyle(
                                    fontSize: 46,
                                    color: Colors.red,
                                  ),
                                );
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
                              if (country.country != null) {
                                debugPrint('Show update data');
                                return Text(
                                  country.recovered,
                                  style: TextStyle(
                                    fontSize: 46,
                                    color: Colors.green,
                                  ),
                                );
                              } else {
                                debugPrint('Show no data');
                                return Text(
                                  '000000',
                                  style: TextStyle(
                                    fontSize: 46,
                                    color: Colors.green,
                                  ),
                                );
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
