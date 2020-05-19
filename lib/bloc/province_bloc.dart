import 'package:aplikasi/api/api_corona.dart';
import 'package:aplikasi/model/model_province.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ProvinceBloc extends Bloc<dynamic, List<Province>> {
  @override
  List<Province> get initialState => [];

  @override
  Stream<List<Province>> mapEventToState(event) async* {
    try {
      List<Province> provinces = await ApiCorona.getProvince();
      yield provinces;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

}