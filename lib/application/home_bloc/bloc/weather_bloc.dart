import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:flutter_weather_app/core/url.dart';
import 'package:flutter_weather_app/domain/weather_resp/weather_resp.dart';
import 'package:geolocator/geolocator.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        final Response response =
            await Dio(BaseOptions()).get(baseUrl, queryParameters: {
          'lat': event.position!.latitude,
          'lon': event.position!.longitude,
        });
        final result = WeatherResp.fromJson(response.data);

        log('this : ${result.main}');
        emit(WeatherBlocSuccess(response: result));
      } catch (e) {
        emit(WeatherBlocFailure());
      }
    });
  }
}
