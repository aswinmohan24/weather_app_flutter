import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/application/home_bloc/bloc/weather_bloc.dart';

import 'package:flutter_weather_app/widgets/bg_container_widget.dart';
import 'package:flutter_weather_app/widgets/bottom_forecast_widget.dart';
import 'package:flutter_weather_app/widgets/loading_widget.dart';
import 'package:flutter_weather_app/widgets/weather_icon_widget.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
//---------function for showing weatheer condition icon based on weather condition code fetching from API -------------//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        ),
        body: Padding(
            padding:
                const EdgeInsets.fromLTRB(35, 1.2 * kToolbarHeight, 35, 20),
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    const BgContainerWidget(
                      startAxisAlign: 9,
                      yAxisAlign: -0.2,
                    ),
                    const BgContainerWidget(
                        startAxisAlign: -9, yAxisAlign: -0.2),
                    Align(
                      alignment: const AlignmentDirectional(0, -1.3),
                      child: Container(
                        height: 300,
                        width: 600,
                        decoration:
                            BoxDecoration(color: Colors.lightBlueAccent[700]),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 1),
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        decoration: const BoxDecoration(color: Colors.black),
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                      child: Container(
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                      ),
                    ),
                    BlocBuilder<WeatherBloc, WeatherState>(
                      builder: (context, state) {
                        if (state is WeatherBlocSuccess) {
                          //creating a list of main weather condition from the resposne Weather List
                          final weatherList = state.response.weather!;
                          final newWeatherConditionList = weatherList.map((e) {
                            return e.main;
                          }).toList();
                          //--------------------------------------------------
                          //creating a list of weatherconditioncode from the resposne Weather List

                          final newWeatherConditionCodeList =
                              weatherList.map((e) {
                            return e.id;
                          }).toList();
                          log('code : $newWeatherConditionCodeList');
                          //------------------------------------------------------//

                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    '📍${state.response.name}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35),
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                GetWeatherIcon(
                                    weatherConditionCode:
                                        newWeatherConditionCodeList[0]!
                                            .toInt()),
                                Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      ' ${state.response.main!.temp.round()}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 85),
                                    ),
                                    Transform.translate(
                                      offset: const Offset(0, -18),
                                      child: const Text(
                                        '℃',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 30),
                                      ),
                                    )
                                  ],
                                )),
                                Center(
                                  child: Text(
                                    newWeatherConditionList[0]
                                        .toString()
                                        .toUpperCase(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 28),
                                  ),
                                ),
                                Center(
                                    child: Text(
                                  parsingFromUnixToDateTime(
                                      state.response.dt!.toInt(), 'EEEE dd •'),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 16),
                                )),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BottomForecastWidget(
                                      image: 'assets/images/11.png',
                                      mainText: ' Sunrise',
                                      subText: parsingFromUnixToDateTime(
                                          state.response.sys!.sunrise!.toInt(),
                                          ''),
                                    ),
                                    BottomForecastWidget(
                                      image: 'assets/images/12.png',
                                      mainText: ' Sunset',
                                      subText: parsingFromUnixToDateTime(
                                          state.response.sys!.sunset!.toInt(),
                                          ''),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  child: Divider(
                                    color: Colors.grey.withOpacity(.3),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BottomForecastWidget(
                                      image: 'assets/images/13.png',
                                      mainText: 'Temp Max',
                                      subText:
                                          '${state.response.main!.tempMax!.round()}℃',
                                    ),
                                    BottomForecastWidget(
                                      image: 'assets/images/14.png',
                                      mainText: 'Temp Min',
                                      subText:
                                          '${state.response.main!.tempMin!.round()}℃',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        } else {
                          return const HomeScreenLoadingWidget();
                        }
                      },
                    )
                  ],
                ))));
  }

  //this function converts unixexpoch timestamp to DateTime format
  String parsingFromUnixToDateTime(int unixTimeStamp, String? dateFormatType) {
    final unixEpoch = unixTimeStamp;
    final millisecondsSinceEpoch = unixEpoch * 1000;
    final DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
    //final String newDatetime = dateTime.toString();
    final String formattedDatetime =
        DateFormat(dateFormatType).add_jm().format(dateTime);
    return formattedDatetime;
    // formattedDatetime is the proper DateTime String we want
  }
}
