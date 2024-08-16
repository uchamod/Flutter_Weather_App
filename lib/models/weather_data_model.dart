class WeatherModel {
  final String city;
  final double temprature;
  final String weatherCondition;
  final double weatherDiscription;
  final double windSpeed;
  final double humadity;
  final double preasure;

  WeatherModel(
      {required this.city,
      required this.temprature,
      required this.weatherCondition,
      required this.weatherDiscription,
      required this.windSpeed,
      required this.humadity,
      required this.preasure});
  
  //convert specific json data to dart model
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        city: json["name"],
        temprature: json["main"]["temp"],
        weatherCondition: json["weather"][0]["main"],
        weatherDiscription: json["weather"][0]["description"],
        windSpeed: json["wind"]["speed"],
        humadity: json["main"]["humidity"],
        preasure: json["main"]["pressure"]);
  }
}
