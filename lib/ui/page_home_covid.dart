import 'package:aplikasi/bloc/countries_bloc.dart';
import 'package:aplikasi/bloc/country_bloc.dart';
import 'package:aplikasi/bloc/province_bloc.dart';
import 'package:aplikasi/ui/page_statistic_covid.dart';
import 'package:aplikasi/ui/page_statistic_indonesia.dart';
import 'package:aplikasi/ui/page_statistic_world.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageHomeCovid extends StatefulWidget {
  final String title;

  PageHomeCovid({@required this.title});

  @override
  _PageHomeCovidState createState() => _PageHomeCovidState();
}

class _PageHomeCovidState extends State<PageHomeCovid> {

  CountryBloc countryBloc;
  ProvinceBloc provinceBloc;
  CountriesBloc countriesBloc;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData(){
    countryBloc = BlocProvider.of<CountryBloc>(context);
    countryBloc.add('indonesia');
    provinceBloc = BlocProvider.of<ProvinceBloc>(context);
    provinceBloc.add('');
    countriesBloc = BlocProvider.of<CountriesBloc>(context);
    countriesBloc.add('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _bnbPages[_bnbCurrentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          loadData();
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bnbItems,
        currentIndex: _bnbCurrentIndex,
        showUnselectedLabels: false,
        elevation: 8,
        onTap: (context) {
          setState(() {
            _bnbCurrentIndex = context;
          });
        },
      ),
    );
  }

  int _bnbCurrentIndex = 0;

  List<Widget> _bnbPages = [
//    BlocProvider(
//      builder: (context) => CountryBloc(),
//      child: PageStatisticCovid(),
//    ),
//    BlocProvider(
//      builder: (context) => ProvinceBloc(),
//      child: PageStatisticIndonesia(),
//    ),
//    BlocProvider(
//      builder: (context) => CountriesBloc(),
//      child: PageStatisticWorld(),
//    ),
    PageStatisticCovid(),
    PageStatisticIndonesia(),
    PageStatisticWorld(),
  ];

  List<BottomNavigationBarItem> _bnbItems = [
    BottomNavigationBarItem(icon: Icon(Icons.poll), title: Text('Beranda')),
    BottomNavigationBarItem(icon: Icon(Icons.flag), title: Text('Indonesia')),
    BottomNavigationBarItem(icon: Icon(Icons.public), title: Text('Dunia')),
  ];
}
