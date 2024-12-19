import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wether_api/models/models.dart';

class WeatherHelper {
  Future<Wetherapimodel?> Getdata(String search) async {
    String link =
        "https://api.openweathermap.org/data/2.5/weather?q=$search&appid=f38665aa25cbf25ad8f3a75ece225e9d";
    http.Response response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      Wetherapimodel modal = Wetherapimodel.maptomodel(json);
      return modal;
    } else {
      print("*-*-error*-*- ${response.body}");
      return null;
    }
  }
}
