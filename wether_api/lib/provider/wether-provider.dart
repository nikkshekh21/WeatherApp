import 'package:flutter/material.dart';
import 'package:wether_api/models/models.dart';

import '../helper/helper.dart';

class HomeProvider with ChangeNotifier {
  Wetherapimodel? model;
  String? name;
  bool isFavorite = false;

  void getWeatherData(String search) async {
    WeatherHelper helper = WeatherHelper();
    model = await helper.Getdata(search);
    name = search;

    print("-----------------------------------$search");

    notifyListeners();
  }
}
