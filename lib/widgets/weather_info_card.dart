import 'package:flutter/material.dart';
import 'package:whether_app/util/constant.dart';

class WeatherInfoCard extends StatefulWidget {
  const WeatherInfoCard({super.key});

  @override
  State<WeatherInfoCard> createState() => _WeatherInfoCardState();
}

class _WeatherInfoCardState extends State<WeatherInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: horPad, vertical: verPad),
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
            "Clear sky",
            style: title.copyWith(color: light),
          ),
          SizedBox(
            height: 10,
          ),
          //preasure
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Preasure",
                style: weatherInfo,
              ),
              Text(
                "100ha",
                style: weatherInfo,
              )
            ],
          ),
          const Divider(
            color: light,
          ),
          //humadity
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "humidity",
                style: weatherInfo,
              ),
              Text(
                "60%",
                style: weatherInfo,
              )
            ],
          ),
          const Divider(
            color: light,
          ),
          //preasure
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "wind speed",
                style: weatherInfo,
              ),
              Text(
                "1.2m/s",
                style: weatherInfo,
              )
            ],
          ),
        ],
      ),
    );
  }
}
