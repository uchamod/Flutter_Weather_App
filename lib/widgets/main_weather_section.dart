import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whether_app/models/weather_data_model.dart';
import 'package:whether_app/util/constant.dart';

class MainWeatherSection extends StatefulWidget {
  final WeatherModel weatherModel;
  const MainWeatherSection({super.key, required this.weatherModel});

  @override
  State<MainWeatherSection> createState() => _MainWeatherSectionState();
}

class _MainWeatherSectionState extends State<MainWeatherSection> {
  String getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('h:mm a').format(now);
    return formattedTime;
  }

  @override
  void initState() {
    getCurrentTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: horPad, vertical: verPad),
      width: double.infinity,
      color: mainWrec,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.weatherModel.temprature}°C",
                style: display,
              ),
              Text(
                widget.weatherModel.weatherCondition,
                style: display,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              Text(
                getCurrentTime(),
                style: subtitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
