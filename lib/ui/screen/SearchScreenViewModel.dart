import 'package:flutter/material.dart';
import 'package:flutter_location_based_search/data/local/models/CityDistrictModel.dart';
import 'package:flutter_location_based_search/data/local/models/SearchRepositroy.dart';

enum SearchState { Idle, Searching, Seached }

class SearchScreenViewModel with ChangeNotifier {
  SearchRepoSitory _repo;
  SearchState _state = SearchState.Idle;
  List<String> _searchResultList;

  List<String> get searchResultList => _searchResultList;

  SearchScreenViewModel(BuildContext context) {
    _repo = SearchRepoSitory(context);
    _searchResultList = List();
  }

  searchText(String searchText) async {
    _state = SearchState.Searching;
    notifyListeners();
    if (searchText.isEmpty) {

      _state = SearchState.Seached;
      _searchResultList.clear();
      notifyListeners();

    } else {

      List<CityDistrictModel> cityDistrictList = await _repo.getCityDistrictList();
      _searchResultList.clear();

      cityDistrictList.forEach((element) {
        if (element.cityName.toLowerCase().contains(searchText) || element.cityName.toUpperCase().contains(searchText)) {
          _searchResultList.add(element.cityName);
        }

        element.districtList.forEach((district) {
          if (district.toLowerCase().contains(searchText) || district.toUpperCase().contains(searchText)) {
            _searchResultList.add("${element.cityName}/$district");
          }
        });
      });

      _searchResultList.sort();

      _state = SearchState.Seached;
      notifyListeners();
    }
  }

  SearchState get state => _state;
}
