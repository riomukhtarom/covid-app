import 'package:aplikasi/api/api_corona.dart';
import 'package:aplikasi/bloc/province_bloc.dart';
import 'package:aplikasi/model/model_countries.dart';
import 'package:aplikasi/model/model_country.dart';
import 'package:aplikasi/ui/page_home_covid.dart';
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