import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whether_app/models/weather_data_model.dart';
import 'package:whether_app/util/constant.dart';

class WeatherInfoCard extends StatefulWidget {
  final WeatherModel weatherModel;
  const WeatherInfoCard({super.key, required this.weatherModel});

  @override
  State<WeatherInfoCard> createState() => _WeatherInfoCardState();
}

class _WeatherInfoCardState extends State<WeatherInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: verPad),
      padding: const EdgeInsets.only(
          left: horPad, right: horPad, top: 15, bottom: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
            colors: [linerGradient1, linerGradient2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //discription
          Text(
            widget.weatherModel.weatherDiscription,
            style: title.copyWith(color: light),
          ),
          const SizedBox(
            height: 10,
          ),
          //feels_like
          weatherProperty("feels_Like", Icons.hotel_class,
              widget.weatherModel.feelsLike, "°C"),
          const Divider(
            color: light,
          ),
          //min temp
          weatherProperty("min_temp", CupertinoIcons.down_arrow,
              widget.weatherModel.minTemp, "°C"),
          const Divider(
            color: light,
          ),
          //max temp
          weatherProperty("max_temp", CupertinoIcons.up_arrow,
              widget.weatherModel.maxTemp, "°C"),
          const Divider(
            color: light,
          ),
          //preasure
          weatherProperty("wind_speed", Icons.wind_power,
              widget.weatherModel.windSpeed, "m/s"),
          const Divider(
            color: light,
          ),
          //wind spped
          weatherProperty("pressuer", Icons.pool_rounded,
              widget.weatherModel.preasure, "hpa"),
          const Divider(
            color: light,
          ),
          //humadity
          weatherProperty(
              "humidity", Icons.water_drop, widget.weatherModel.humadity, "%"),
          const Divider(
            color: light,
          ),
          //vissibility
          weatherProperty("visibility", Icons.visibility,
              widget.weatherModel.visibility, ""),
        ],
      ),
    );
  }

  Widget weatherProperty(
      String name, IconData icon, dynamic value, String prefix) {
    return Row(
      children: [
        Text(
          name,
          style: weatherInfo,
        ),
        const SizedBox(
          width: 10,
        ),
        Icon(
          icon,
          size: 20,
          color: light,
        ),
        const Spacer(),
        Text(
          value.toString() + prefix,
          style: weatherInfo,
        )
      ],
    );
  }
}
