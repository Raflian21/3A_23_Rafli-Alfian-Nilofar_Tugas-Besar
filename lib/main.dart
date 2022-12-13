import 'package:flutter/material.dart';
import 'package:weather_tracker/data_service.dart';
import 'package:weather_tracker/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController controller = TextEditingController();
  DataService dataService = DataService();
  Weather weather = Weather();
  bool isFetch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Weather Tracker by Rafli')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isFetch
                  ? Column(
                      children: [
                        Image.network(
                            'http://openweathermap.org/img/wn/${weather.icon}@2x.png'),
                        Text(
                          '${weather.temp}°',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(
                          weather.description,
                          style: Theme.of(context).textTheme.headline4,
                        )
                      ],
                    )
                  : SizedBox(),
              Container(
                width: 150,
                padding: EdgeInsets.symmetric(vertical: 50),
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(labelText: 'City'),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    isFetch = true;
                    weather = await dataService.fetchData(controller.text);
                    setState(() {});
                  },
                  child: Text('Search'))
            ],
          ),
        ));
  }
}
