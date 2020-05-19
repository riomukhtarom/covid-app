import 'dart:convert';

import 'package:aplikasi/model/model_countries.dart';
import 'package:aplikasi/model/model_country.dart';
import 'package:aplikasi/model/model_province.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCorona {
  String baseUrl = "https://api.kawalcorona.com";

  String getUrl() {
    return this.baseUrl;
  }

  static Future<List<Countries>> getCountries() async {
    
    // Url
    // https://api.kawalcorona.com

    // Response
    // [
    //     {
    //         "attributes": {
    //             "OBJECTID": 18,
    //             "Country_Region": "US",
    //             "Last_Update": 1587695464000,
    //             "Lat": 40,
    //             "Long_": -100,
    //             "Confirmed": 868945,
    //             "Deaths": 49887,
    //             "Recovered": 80174,
    //             "Active": 738884
    //         }
    //     },
    //     {
    //         "attributes": {
    //             "OBJECTID": 161,
    //             "Country_Region": "Spain",
    //             "Last_Update": 1587695430000,
    //             "Lat": 40.463667,
    //             "Long_": -3.74922,
    //             "Confirmed": 213024,
    //             "Deaths": 22157,
    //             "Recovered": 89250,
    //             "Active": 101617
    //         }
    //     }
    // ]

    debugPrint('Loading Data Covid in World ...');
    String url = "https://api.kawalcorona.com";
    var result = await http.get(url);
    List<Countries> countries = [];

    if (result.statusCode == 200) {
      var jsonObject = json.decode(result.body);
      List<dynamic> listResponse = jsonObject.cast<Map<String, dynamic>>();
      
      for (var i = 0; i < listResponse.length; i++) {
        var country = (listResponse[i] as Map<String, dynamic>)['attributes'];
        countries.add(Countries.toCountries(country));
      }
      int length = countries.length;
      debugPrint('Success to load $length data Covid in World');
      return countries;
    } else {
      throw Exception('failed');
    }
  }

  static Future<Country> getCountry(String countryName) async {
    // Url
    // https://api.kawalcorona.com/indonesia

    // Response
    // [ 
    //     {
    //         "name": "Indonesia",
    //         "positif": 7732,
    //         "meninggal": 568,
    //         "sembuh": 892
    //     }
    // ]

    String url = "https://api.kawalcorona.com/" + countryName;
    var result = await http.get(url);

    if (result.statusCode == 200) {
      var jsonObject = json.decode(result.body);
      List<dynamic> listResponse = jsonObject.cast<Map<String, dynamic>>();
      Country country = Country.toCountry(listResponse[0]);
      String name = country.country;
      debugPrint('Success to load data covid $name');
      return country;
    } else {
      throw Exception('failed');
    }
  }

  static Future<List<Province>> getProvince() async {
    
    // Url
    // https://api.kawalcorona.com/indonesia/provinsi

    // Response
    // [
    //     {
    //         "attributes": {
    //             "FID": 11,
    //             "Kode_Provi": 31,
    //             "Provinsi": "DKI Jakarta",
    //             "Kasus_Posi": 3517,
    //             "Kasus_Semb": 326,
    //             "Kasus_Meni": 301
    //         }
    //     },
    //     {
    //         "attributes": {
    //             "FID": 12,
    //             "Kode_Provi": 32,
    //             "Provinsi": "Jawa Barat",
    //             "Kasus_Posi": 784,
    //             "Kasus_Semb": 87,
    //             "Kasus_Meni": 74
    //         }
    //     }
    // ]
    debugPrint('Loading data Covid in Indonesia ...');
    String url = "https://api.kawalcorona.com/indonesia/provinsi";
    var result = await http.get(url);
    List<Province> listProvince = [];

    if (result.statusCode == 200) {
      var jsonObject = json.decode(result.body);
      List<dynamic> listResponse = jsonObject.cast<Map<String, dynamic>>();
      
      for (var i = 0; i < listResponse.length; i++) {
        var province = (listResponse[i] as Map<String, dynamic>)['attributes'];
        listProvince.add(Province.toProvince(province));
      }
      int length = listProvince.length;
      debugPrint('Success to load $length data Covid in Indonesia');
      return listProvince;

    } else {
      throw Exception('failed');
    }
  }

}
