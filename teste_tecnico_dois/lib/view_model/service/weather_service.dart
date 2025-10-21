// --- Serviço Mockado ---
import 'dart:async';
import 'dart:math';

import 'package:teste_tecnico_dois/model/entities/hourly_forecast.dart';
import 'package:teste_tecnico_dois/model/entities/weather_data.dart';
import "package:teste_tecnico_dois/model/workflow/weather_workflow.dart";

class MockWeatherService implements WeatherWorkflow {
  @override
  Stream<WeatherData> getWeatherStream(String cityName) {
    // Controller para gerenciar o stream
    final controller = StreamController<WeatherData>();

    // Timer para emitir dados periodicamente
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      // Simula pequenas variações na temperatura
      final random = Random();
      final currentTemp = 20 + random.nextDouble() * 5;
      final conditions = ['Ensolarado', 'Nublado', 'Chuvoso'];
      final currentCondition = conditions[random.nextInt(conditions.length)];

      final forecast = List.generate(8, (index) {
        return HourlyForecast(
          time: '${DateTime.now().hour + index + 1}:00',
          condition: conditions[random.nextInt(conditions.length)],
          temperature: (currentTemp - 2 + random.nextDouble() * 4)
              .roundToDouble(),
        );
      });

      // Cria o objeto de dados e adiciona ao stream
      final weatherData = WeatherData(
        cityName: cityName,
        temperature: currentTemp,
        condition: currentCondition,
        hourlyForecast: forecast,
      );

      controller.add(weatherData);

      // Para este exemplo, vamos manter o stream aberto.
      // Em um app real, você teria uma lógica para fechar o controller.
      if (timer.tick >= 3) {
        timer.cancel();
        controller.close();
      }
    });

    return controller.stream;
  }
}
