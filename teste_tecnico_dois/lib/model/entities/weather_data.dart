// --- Modelos de Dados ---
import 'package:teste_tecnico_dois/model/entities/hourly_forecast.dart';

class WeatherData {
  final String cityName;
  final double temperature;
  final String condition;
  final List<HourlyForecast> hourlyForecast;

  WeatherData({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.hourlyForecast,
  });
}
