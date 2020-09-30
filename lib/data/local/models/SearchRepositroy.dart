import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_location_based_search/data/local/models/CityDistrictModel.dart';

class SearchRepoSitory {

  BuildContext context;
  SearchRepoSitory(this.context);


  Future<List<CityDistrictModel>> getCityDistrictList() async {
    String jsonData = await DefaultAssetBundle.of(context).loadString("assets/city_district.json");
    return (json.decode(jsonData) as List).map((singleObject) => CityDistrictModel.fromJson(singleObject)).toList();
  }


}
