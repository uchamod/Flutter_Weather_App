import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:whether_app/models/weather_data_model.dart';
import 'package:whether_app/pages/homepage.dart';
import 'package:whether_app/services/api_services.dart';
import 'package:whether_app/util/constant.dart';
import 'package:whether_app/widgets/main_weather_section.dart';
import 'package:whether_app/widgets/weather_info_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();

  final ApiServices _services =
      ApiServices(apiKey: dotenv.env["OPEN_WEATHER_API_KEY"] ?? "");
  WeatherModel? _weather;
  void fetchWeatherByCity(String city) async {
    try {
      final weather = await _services.getWeatherByCity(city);
      if (weather == null) {
        return;
      }
      setState(() {
        _weather = weather;
      });
    } catch (err) {
      throw Exception("error");
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 228, 228, 228),
        child: const Icon(
          CupertinoIcons.arrow_left,
          size: 28,
          color: dark,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Homepage(),
              ));
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: horPad, vertical: 10),
                child: TextField(
                  style: weatherInfo,
                  controller: _searchController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: dark),
                    ),
                    label: Text(
                      "City Name",
                      style: weatherInfo.copyWith(fontSize: 16),
                    ),
                  ),
                  cursorColor: dark,
                  keyboardType: TextInputType.text,
                  onSubmitted: (value) {
                    fetchWeatherByCity(_searchController.text.trim());
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _weather != null
                  ? Column(
                      children: [
                        MainWeatherSection(weatherModel: _weather!),
                        const SizedBox(
                          height: 15,
                        ),
                        WeatherInfoCard(weatherModel: _weather!)
                      ],
                    )
                  : const SizedBox(
                      height: 400,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
