import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_location_based_search/data/local/models/CityDistrictModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class SearchRepoSitory {
  BuildContext context;

  SearchRepoSitory(this.context);

  Future<List<CityDistrictModel>> getCityDistrictList() async {
    String jsonData = await DefaultAssetBundle.of(context).loadString("assets/city_district.json");
    return (json.decode(jsonData) as List).map((singleObject) => CityDistrictModel.fromJson(singleObject)).toList();
  }

  Future<Map<String, double>> _getPhoneLocation() async {
    bool permissionState = await isLocationServiceEnabled();
    if (permissionState) {
      Map<String, double> map = Map();

      Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      map["latitude"] = position.latitude;
      map["longitude"] = position.longitude;

      return map;
    } else {
      throw Exception("Permission not permit");
    }
  }

  Future<List<Placemark>> getAddress() async{
    try{
      Map<String, double> location = await _getPhoneLocation();
      List<Placemark> placemarks = await placemarkFromCoordinates(location["latitude"], location["longitude"]);
      return placemarks;

    } catch (e){
      throw Exception("Placemark exception $e");
    }
  }
}
