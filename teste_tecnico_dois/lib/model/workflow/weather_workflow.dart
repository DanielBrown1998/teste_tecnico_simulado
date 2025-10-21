import 'package:teste_tecnico_dois/model/entities/weather_data.dart';

abstract class WeatherWorkflow {
  Stream<WeatherData> getWeatherStream(String cityName);
}
