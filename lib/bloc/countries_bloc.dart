import 'package:aplikasi/api/api_corona.dart';
import 'package:aplikasi/model/model_countries.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

class CountriesBloc extends Bloc<dynamic, List<Countries>> {
  @override
  List<Countries> get initialState => [];

  @override
  Stream<List<Countries>> mapEventToState(event) async* {
    try {
      List<Countries> countries = await ApiCorona.getCountries();
      yield countries;
    } catch (e) {
      debugPrint(e);
    }

  }

}