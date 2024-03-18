import 'package:json_annotation/json_annotation.dart';

part 'weather_resp.g.dart';

@JsonSerializable()
class WeatherResp {
  @JsonKey(name: 'weather')
  List<Weather>? weather;

  @JsonKey(name: 'main')
  Main? main;

  @JsonKey(name: 'dt')
  num? dt;

  @JsonKey(name: 'sys')
  Sys? sys;

  @JsonKey(name: 'id')
  num? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'cod')
  num? cod;

  WeatherResp({
    this.weather,
    this.main,
    this.dt,
    this.sys,
    this.id,
    this.name,
    this.cod,
  });

  factory WeatherResp.fromJson(Map<String, dynamic> json) {
    return _$WeatherRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeatherRespToJson(this);
}

@JsonSerializable()
class WeatherResultData {}

@JsonSerializable()
class Weather {
  @JsonKey(name: 'id')
  num? id;

  @JsonKey(name: 'main')
  String? main;

  Weather({
    this.id,
    this.main,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return _$WeatherFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Main {
  @JsonKey(name: 'temp')
  num temp;

  @JsonKey(name: 'temp_min')
  num? tempMin;
  @JsonKey(name: 'temp_max')
  num? tempMax;

  Main({
    this.temp = 0,
    this.tempMin,
    this.tempMax,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}

@JsonSerializable()
class Sys {
  @JsonKey(name: 'country')
  String? country;

  @JsonKey(name: 'sunrise')
  num? sunrise;

  @JsonKey(name: 'sunset')
  num? sunset;

  Sys({this.country, this.sunrise, this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);
}
