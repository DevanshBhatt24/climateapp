import 'package:clima/services/networking.dart';
import 'package:clima/screens/grtlocation.dart';

const apikey = "cb6036b79c1f8412488bace558561288";

class WeatherModel {
  Future<dynamic> citydata(String cityname) async {
    network net = network(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey&units=metric');

    var weatherdata = await net.getdata();
    return weatherdata;
  }

  Future<dynamic> locationdata() async {
    getloaction gc = getloaction();
    await gc.currgetlocation();
    network net = network(
        'https://api.openweathermap.org/data/2.5/weather?lat=${gc.lat}&lon=${gc.lon}&appid=$apikey&units=metric');

    var weatherdata = await net.getdata();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
