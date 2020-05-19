import 'package:aplikasi/bloc/countries_bloc.dart';
import 'package:aplikasi/model/model_countries.dart';
import 'package:aplikasi/view/item_region.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageStatisticWorld extends StatelessWidget {
  final List<Countries> listCountries = [];

  @override
  Widget build(BuildContext context) {
    CountriesBloc countriesBloc = BlocProvider.of<CountriesBloc>(context);
//    countriesBloc.dispatch('');
    return Container(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: BlocBuilder<CountriesBloc, List<Countries>>(
        builder: (context, countries) {
          if (countries.isNotEmpty) {
            listCountries.clear();
            listCountries.addAll(countries);
            debugPrint('Show update Contries');
            return CountriesList(items: countries);
          } else if (listCountries.isNotEmpty) {
            debugPrint('Show backup Contries');
            return CountriesList(items: listCountries);
          } else {
            debugPrint('Show no data');
            return Center(child: Text('Tidak Ada data'));
          }
        },
      ),
    );
  }
}

class CountriesList extends StatelessWidget {
  final List<Countries> items;

  CountriesList({this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemRegion(
            name: items[index].name,
            confirmed: items[index].confirmed,
            deaths: items[index].deaths,
            recovered: items[index].recovered,
          );
        });
  }
}
