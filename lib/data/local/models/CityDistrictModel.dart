

class CityDistrictModel {
  String cityName;
  int plate;
  List<String> districtList;

  CityDistrictModel({this.cityName, this.plate, this.districtList});

  CityDistrictModel.fromJson(Map<String, dynamic> json) {
    cityName = json['city_name'];
    plate = json['plate'];
    districtList = json['district_list'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_name'] = this.cityName;
    data['plate'] = this.plate;
    data['district_list'] = this.districtList;
    return data;
  }
}