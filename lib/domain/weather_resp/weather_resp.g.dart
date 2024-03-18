// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResp _$WeatherRespFromJson(Map<String, dynamic> json) => WeatherResp(
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: json['main'] == null
          ? null
          : Main.fromJson(json['main'] as Map<String, dynamic>),
      dt: json['dt'] as num?,
      sys: json['sys'] == null
          ? null
          : Sys.fromJson(json['sys'] as Map<String, dynamic>),
      id: json['id'] as num?,
      name: json['name'] as String?,
      cod: json['cod'] as num?,
    );

Map<String, dynamic> _$WeatherRespToJson(WeatherResp instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'main': instance.main,
      'dt': instance.dt,
      'sys': instance.sys,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };

WeatherResultData _$WeatherResultDataFromJson(Map<String, dynamic> json) =>
    WeatherResultData();

Map<String, dynamic> _$WeatherResultDataToJson(WeatherResultData instance) =>
    <String, dynamic>{};

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      id: json['id'] as num?,
      main: json['main'] as String?,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
    };

Main _$MainFromJson(Map<String, dynamic> json) => Main(
      temp: json['temp'] as num? ?? 0,
      tempMin: json['temp_min'] as num?,
      tempMax: json['temp_max'] as num?,
    );

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
    };

Sys _$SysFromJson(Map<String, dynamic> json) => Sys(
      country: json['country'] as String?,
      sunrise: json['sunrise'] as num?,
      sunset: json['sunset'] as num?,
    );

Map<String, dynamic> _$SysToJson(Sys instance) => <String, dynamic>{
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
