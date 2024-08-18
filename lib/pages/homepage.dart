import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:whether_app/models/weather_data_model.dart';
import 'package:whether_app/pages/search_page.dart';
import 'package:whether_app/provider/provider.dart';
import 'package:whether_app/services/api_services.dart';
import 'package:whether_app/services/lottie_service.dart';
import 'package:whether_app/util/constant.dart';
import 'package:whether_app/widgets/main_weather_section.dart';
import 'package:whether_app/widgets/weather_info_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ApiServices _services =
      ApiServices(apiKey: dotenv.env["OPEN_WEATHER_API_KEY"] ?? "");
  WeatherModel? _weatherModel;
  //fetch current weather data
  void fetchWeather() async {
    try {
      final weather = await _services.getWeatherByCurrentLocation();
      setState(() {
        _weatherModel = weather;
      });
    } catch (err) {
      throw Exception("data fetched error");
    }
  }

  @override
  void initState() {
    fetchWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _weatherModel == null
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //top
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: horPad, vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SearchPage(),
                                  ));
                            },
                            icon: const Icon(
                              Icons.search,
                              size: 32,
                            ),
                          ),
                          Text(
                            _weatherModel!.city,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          //mode change button
                          Consumer<ThemeProvider>(
                            builder: (context, value, child) {
                              return IconButton(
                                onPressed: () {
                                  Provider.of<ThemeProvider>(context,
                                          listen: false)
                                      .changeMode(
                                          Theme.of(context).brightness ==
                                              Brightness.dark);
                                },
                                //mode icon
                                icon: Icon(
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Icons.dark_mode
                                      : Icons.light_mode,
                                  size: 28,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //lottie animation
                    Center(
                      child: Lottie.network(
                        fit: BoxFit.contain,
                        width: 350,
                        height: 350,
                        LottieFunction().getWeatherAnimation(
                            condition: _weatherModel!.weatherCondition),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    //main weather section
                    MainWeatherSection(
                      weatherModel: _weatherModel!,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    WeatherInfoCard(
                      weatherModel: _weatherModel!,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
