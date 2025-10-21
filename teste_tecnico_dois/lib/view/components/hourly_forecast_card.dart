import 'package:flutter/material.dart';
import 'package:teste_tecnico_dois/model/entities/hourly_forecast.dart';

class HourlyForecastCard extends StatelessWidget {
  final HourlyForecast item;
  final double height;
  final double width;
  const HourlyForecastCard({
    super.key,
    required this.item,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        side: BorderSide(width: 0, color: Colors.transparent),
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text(item.condition), Text(item.time)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  (item.condition == "Ensolarado")
                      ? Icon(Icons.wb_sunny)
                      : (item.condition == "Nublado")
                      ? Icon(Icons.cloud)
                      : Icon(Icons.grain),
                  Text(
                    "${item.temperature.toString()}°C",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
