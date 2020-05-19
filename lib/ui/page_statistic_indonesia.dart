import 'package:aplikasi/bloc/province_bloc.dart';
import 'package:aplikasi/model/model_province.dart';
import 'package:aplikasi/view/item_region.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageStatisticIndonesia extends StatelessWidget {
  final List<Province> listProvince = [];

  @override
  Widget build(BuildContext context) {
    ProvinceBloc bloc = BlocProvider.of<ProvinceBloc>(context);
//    bloc.dispatch('');
    return Container(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: BlocBuilder<ProvinceBloc, List<Province>>(
        builder: (context, provinces) {
          if (provinces.isNotEmpty) {
            listProvince.clear();
            listProvince.addAll(provinces);
            debugPrint('Show update Provinces');
            return ProvinceList(items: provinces);
          } else if (listProvince.isNotEmpty) {
            debugPrint('Show backup Provinces');
            return ProvinceList(items: listProvince);
          } else {
            debugPrint('Show no data');
            return Center(child: Text('Tidak Ada data'));
          }
        }
      ),
    );
  }
}

class ProvinceList extends StatelessWidget {
  final List<Province> items;

  ProvinceList({this.items});

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
