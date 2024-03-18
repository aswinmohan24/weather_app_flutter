part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherBlocInitial extends WeatherState {}

final class WeatherBlocLoading extends WeatherState {}

final class WeatherBlocFailure extends WeatherState {}

final class WeatherBlocSuccess extends WeatherState {
  final WeatherResp response;

  const WeatherBlocSuccess({required this.response});
}
