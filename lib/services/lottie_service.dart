class LottieFunction {
  String getWeatherAnimation({required String condition}) {
    switch (condition.toLowerCase()) {
      case "clouds":
      case "mist":
      case "smoke":
      case "haze":
      case "dust":
      case "fog":
        return "https://lottie.host/1809f512-dcd1-4c5d-89e8-24545cf6d2ea/OeDlnC8PpA.json";

      case "rain":
      case "drizzle":
      case "shower rain":
        return "https://lottie.host/344dde7b-2231-4cec-9543-817262bb1151/4kpVW7zzfW.json";

      case "thunderstorm":
        return "https://lottie.host/c96a23f3-1f46-42c6-a95d-a9c0b7a54dda/YemqBlyfl7.json";

      case "clear":
        return "https://lottie.host/b13a73ac-a76e-4e96-b153-15ccbfe38d7e/neys4ZQIzZ.json";

      default:
        return "https://lottie.host/b13a73ac-a76e-4e96-b153-15ccbfe38d7e/neys4ZQIzZ.json";
    }
  }
}
