import 'package:flutter/material.dart';
import 'package:teste_tecnico_dois/view/home.dart';
import 'package:teste_tecnico_dois/view_model/repository/wheater_repository.dart';
import 'package:teste_tecnico_dois/view_model/service/weather_service.dart';

void main() {
  runApp(ClimaAgoraApp());
}

class ClimaAgoraApp extends StatelessWidget {
  final wheaterRepository = WheaterRepository(
    mockWheaterService: MockWeatherService(),
  );
  ClimaAgoraApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Home(title: 'ClimaAgora', wheaterRepository: wheaterRepository),
    );
  }
}
