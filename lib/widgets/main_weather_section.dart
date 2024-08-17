import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whether_app/util/constant.dart';

class MainWeatherSection extends StatefulWidget {
  const MainWeatherSection({super.key});

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
                "30.0C",
                style: display,
              ),
              Text(
                "Sunny",
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
