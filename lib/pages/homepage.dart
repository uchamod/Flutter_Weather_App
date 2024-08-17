import 'package:flutter/material.dart';
import 'package:whether_app/util/constant.dart';
import 'package:whether_app/widgets/main_weather_section.dart';
import 'package:whether_app/widgets/weather_info_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //top
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: horPad, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 32,
                      color: dark,
                    ),
                  ),
                  Text(
                    "Matara",
                    style: title,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.dark_mode,
                      size: 28,
                      color: dark,
                    ),
                  ),
                ],
              ),
            ),
            //lottie animation
            const SizedBox(
              height: 100,
            ),
            //main weather section
            MainWeatherSection(),
            const SizedBox(
              height: 40,
            ),
            WeatherInfoCard(),
          ],
        ),
      ),
    );
  }
}
