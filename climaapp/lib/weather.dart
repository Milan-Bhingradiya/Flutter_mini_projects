import 'location.dart';



// class WeatherModel {
//   Future<dynamic> getLocationWeather() async {
//     Location location = Location();
//     await location.getCurrentLocation();
//
//     return NetworkHelper(
//       "$kOwmUrl?lat=${location.latitude}&lon=${location.longitude}",
//     ).getData();
//   }
//
//   Future<dynamic> getCityWeather(String city) {
//     return NetworkHelper("$kOwmUrl?q=$city").getData();
//   }
class Weathermodel{

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '☃';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀';
    } else if (condition <= 804) {
      return '☁';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Bhai bas ready tapaman che moj kar ne tu';
    } else if (temp > 20) {
      return 'bhai thoduk thandu vatataran chhe chanda peri le have ';
    } else if (temp < 10) {
      return 'bhai sweater peri le ';
    }else if (temp < 5) {
      return 'Gand fad thandi Bhaii';
    }
    else {
      return 'Bring a 🧥 just in case';
    }
  }
}
