import 'package:teste_tecnico_dois/model/entities/weather_data.dart';
import 'package:teste_tecnico_dois/model/workflow/weather_workflow.dart';
import 'package:teste_tecnico_dois/view_model/service/weather_service.dart';

class WheaterRepository implements WeatherWorkflow {
  MockWeatherService mockWheaterService;
  WheaterRepository({required this.mockWheaterService});

  @override
  Stream<WeatherData> getWeatherStream(String cityName) {
    return mockWheaterService.getWeatherStream(cityName);
  }
}
