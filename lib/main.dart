import 'package:aplikasi/api/api_corona.dart';
import 'package:aplikasi/bloc/province_bloc.dart';
import 'package:aplikasi/bloc/user_bloc.dart';
import 'package:aplikasi/model/model_countries.dart';
import 'package:aplikasi/model/model_country.dart';
import 'package:aplikasi/ui/page_home_covid.dart';
import 'package:aplikasi/ui/page_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'dart:convert';

import 'bloc/countries_bloc.dart';
import 'bloc/country_bloc.dart';

// Main for Corona
void main() => runApp(CovidApp());

class CovidApp extends StatelessWidget {
  final String _title = 'Covid19 Update';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountryBloc>(create: (context) => CountryBloc()..add('indonesia')),
        BlocProvider<ProvinceBloc>(create: (context) => ProvinceBloc()..add('')),
        BlocProvider<CountriesBloc>(create: (context) => CountriesBloc()..add('')),
      ],
      child: MaterialApp(
        title: _title,
        home: PageHomeCovid(title: _title),
      ),
    );
  }
}

// Main for Notification
//void main() => runApp(NotifApp());

// Favorite
//void main() => runApp(MyApp());

//void main() => runApp(MyApp(country: getCountries()));

// Lock Orientation
//void main() {
//  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//      .then((_) {
//    runApp(MyApp(country: getCountries()));
//  });
//}

class MyApp extends StatelessWidget {
  final Future<List<Countries>> country;

  MyApp({Key key, this.country}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context) => UserBloc(),
//        child: PageFavorite(),
        child: PageTab(country: country),
      ),
    );
  }
}

Future<List<Countries>> getCountries() {
  return ApiCorona.getCountries();
}

List<Country> parseCountry(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Country>((json) => Country.toCountry(json)).toList();
}

Future<List<Country>> fetchCountry() async {
  final response = await http.get('https://api.kawalcorona.com');

  if (response.statusCode == 200) {
    developer.log("Result " + response.body.toString());
    return parseCountry(response.body);
  } else {
    throw Exception('Failed');
  }
}

// List<Country> parseCountry(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//   developer.log("Parse: "+parsed.toString());
//   return parsed.map<Country>((json) => Country.fromMap(json)).toList();
// }

// Future<List<Country>> fetchCountry() async {
//   final response = await http.get('https://api.kawalcorona.com/indonesia');

//   if (response.statusCode == 200) {
//     developer.log("Response: "+response.body.toString());
//     return parseCountry(response.body);
//   } else {
//     throw Exception('Failed');
//   }
// }
