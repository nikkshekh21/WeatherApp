import 'package:wether_api/helper/helper.dart';

class Wetherapimodel {
  String? base, name;
  int? visibility, dt, timezone, id, cod;
  CoordModel? coordModel;
  List<Wetherapi>? wether;
  MainModel? mainModel;
  WindModel? windModel;
  CloudsModel? cloudsModel;
  SysModel? sysModel;
  Wetherapimodel(
      {this.base,
      this.name,
      this.visibility,
      this.dt,
      this.timezone,
      this.id,
      this.cod,
      this.coordModel,
      this.wether,
      this.mainModel,
      this.windModel,
      this.cloudsModel,
      this.sysModel});
  factory Wetherapimodel.maptomodel(Map m1) {
    return Wetherapimodel(
      base: m1["base"],
      name: m1["name"],
      visibility: m1["visibility"],
      dt: m1["dt"],
      timezone: m1["timezone"],
      id: m1["id"],
      cod: m1["cod"],
      coordModel: CoordModel.maptomodel(m1["coord"]),
      wether: List<Wetherapi>.from(
          m1["weather"].map((e) => Wetherapi.maptomodel(e))),
      mainModel: MainModel.maptomodel(m1["main"]),
      windModel: WindModel.maptomodel(m1["wind"]),
      cloudsModel: CloudsModel.maptomodel(m1["clouds"]),
      sysModel: SysModel.maptomodel(m1["sys"]),
    );
  }
}

class CoordModel {
  double? lon, lat;
  CoordModel({this.lon, this.lat});
  factory CoordModel.maptomodel(Map m1) {
    return CoordModel(
      lon: m1["lon"],
      lat: m1["lat"],
    );
  }
}

class Wetherapi {
  int? id;
  String? main, description, icon;
  Wetherapi({this.id, this.main, this.description, this.icon});
  factory Wetherapi.maptomodel(Map m1) {
    return Wetherapi(
      id: m1["id"],
      main: m1["main"],
      description: m1["description"],
      icon: m1["icon"],
    );
  }
}

class MainModel {
  double? temp, feels_like, temp_min, temp_max;
  int? pressure, humidity, sea_level, grnd_level;
  MainModel(
      {this.temp_max,
      this.feels_like,
      this.grnd_level,
      this.humidity,
      this.pressure,
      this.sea_level,
      this.temp,
      this.temp_min});
  factory MainModel.maptomodel(Map m1) {
    return MainModel(
      temp: m1["temp"],
      feels_like: m1["feels_like"],
      temp_min: m1["temp_min"],
      temp_max: m1["temp_max"],
      pressure: m1["pressure"],
      humidity: m1["humidity"],
      sea_level: m1["sea_level"],
      grnd_level: m1["grnd_level"],
    );
  }
}

class WindModel {
  double? speed, gust;
  int? deg;
  WindModel({this.speed, this.deg, this.gust});
  factory WindModel.maptomodel(Map m1) {
    return WindModel(
      speed: m1["speed"],
      deg: m1["deg"],
      gust: m1["gust"],
    );
  }
}

class CloudsModel {
  int? all;
  CloudsModel({this.all});
  factory CloudsModel.maptomodel(Map m1) {
    return CloudsModel(
      all: m1["all"],
    );
  }
}

class SysModel {
  String? country;
  int? sunrise, sunset;
  SysModel({this.country, this.sunrise, this.sunset});
  factory SysModel.maptomodel(Map m1) {
    return SysModel(
      country: m1["country"],
      sunrise: m1["sunrise"],
      sunset: m1["sunset"],
    );
  }
}
// {
// "coord": {
// "lon": 72.8333,
// "lat": 21.1667
// },
// "weather": [
// {
// "id": 802,
// "main": "Clouds",
// "description": "scattered clouds",
// "icon": "03n"
// }
// ],
// "base": "stations",
// "main": {
// "temp": 298.14,
// "feels_like": 297.56,
// "temp_min": 298.14,
// "temp_max": 298.14,
// "pressure": 1013,
// "humidity": 33,
// "sea_level": 1013,
// "grnd_level": 1011
// },
// "visibility": 6000,
// "wind": {
// "speed": 3.09,
// "deg": 40
// },
// "clouds": {
// "all": 32
// },
// "dt": 1734094418,
// "sys": {
// "type": 1,
// "id": 9071,
// "country": "IN",
// "sunrise": 1734053833,
// "sunset": 1734092927
// },
// "timezone": 19800,
// "id": 1255364,
// "name": "Surat",
// "cod": 200
// }
