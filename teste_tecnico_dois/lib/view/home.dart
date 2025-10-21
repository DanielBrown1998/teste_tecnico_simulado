import 'package:flutter/material.dart';
import 'package:teste_tecnico_dois/model/entities/hourly_forecast.dart';
import 'package:teste_tecnico_dois/model/entities/weather_data.dart';
import 'package:teste_tecnico_dois/view/components/hourly_forecast_card.dart';
import 'package:teste_tecnico_dois/view_model/repository/wheater_repository.dart';

class Home extends StatefulWidget {
  final WheaterRepository wheaterRepository;
  const Home({super.key, required this.title, required this.wheaterRepository});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final cityController = TextEditingController();
  bool isSearched = false;
  WeatherData? localData;
  Widget infoWidget(String msg, IconData icon, Color color) => Center(
    child: Column(
      children: [
        Icon(icon, color: color, size: 40),
        Text(msg, style: TextStyle(color: Colors.black87, fontSize: 24)),
      ],
    ),
  );

  Stream<WeatherData> _loadData(String local) {
    Stream<WeatherData> stream = widget.wheaterRepository.getWeatherStream(
      local,
    );
    return stream;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: size.height * .2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 9,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "nome da cidade",
                        ),
                        controller: cityController,
                        keyboardType: TextInputType.text,
                        maxLength: 25,
                        maxLines: 1,
                        autofocus: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "insira uma cidade";
                          }
                          return null;
                        },
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: IconButton(
                        iconSize: 20,
                        onPressed: () async {
                          if (formKey.currentState != null &&
                              formKey.currentState!.validate()) {
                            isSearched = true;
                            setState(() {});
                          }
                        },
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
              (cityController.text.isNotEmpty)
                  ? Expanded(
                      child: Center(
                        child: StreamBuilder(
                          stream: _loadData(cityController.text).take(1),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.connectionState ==
                                    ConnectionState.none ||
                                snapshot.hasError) {
                              return infoWidget(
                                "Houve um Erro!",
                                Icons.error,
                                Colors.red,
                              );
                            } else if (snapshot.connectionState ==
                                    ConnectionState.active ||
                                snapshot.connectionState ==
                                    ConnectionState.done) {
                              if (snapshot.hasData) {
                                localData = snapshot.data!;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      flex: 4,
                                      child: SizedBox(
                                        width: size.width,
                                        height: size.height * .3,
                                        child: Center(
                                          child: Text(
                                            localData!.cityName,
                                            style: TextStyle(
                                              fontSize: 34,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 4,
                                      child: SizedBox(
                                        width: size.width,
                                        height: size.height * .3,
                                        child: Center(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "${localData!.temperature.toStringAsFixed(2)}°C",
                                                style: TextStyle(
                                                  fontSize: 34,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                              Icon(
                                                (localData!.condition ==
                                                        "Ensolarado")
                                                    ? Icons.wb_sunny
                                                    : (localData!.condition ==
                                                          "Nublado")
                                                    ? Icons.cloud
                                                    : Icons.grain,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            localData!.hourlyForecast.length,
                                        itemBuilder: (context, index) {
                                          final HourlyForecast item =
                                              localData!.hourlyForecast[index];
                                          return HourlyForecastCard(
                                            item: item,
                                            width: size.width * .5,
                                            height: size.height * .15,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return infoWidget(
                                  "Sem dados",
                                  Icons.connect_without_contact,
                                  Colors.red,
                                );
                              }
                            }
                            return infoWidget(
                              "Erro desconhecido!",
                              Icons.error_outline,
                              Colors.redAccent,
                            );
                          },
                        ),
                      ),
                    )
                  : Expanded(
                      child: Center(
                        child: Icon(
                          Icons.search_rounded,
                          size: 120,
                          color: Colors.black87,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
