import 'package:aplikasi/api/api_corona.dart';
import 'package:aplikasi/model/model_country.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

class CountryBloc extends Bloc<String, Country> {
  @override
  Country get initialState => Country();

  @override
  Stream<Country> mapEventToState(String event) async* {
    try {
      Country country = await ApiCorona.getCountry(event);
      yield country;
    } catch (e){
      debugPrint(e.toString());
    }
  }
}