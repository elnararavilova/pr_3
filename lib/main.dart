import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: WeatherApp(),
  ));
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int currentContentIndex = 0;
  List<Widget> contentWidgets = [
    TemperatureWidget(),
    DescriptionWidget(),
    AdditionalInfoWidget(),
    UpdateTimeWidget(),
  ];

  void changeContent() {
    setState(() {
      currentContentIndex = (currentContentIndex + 1) % contentWidgets.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Прогноз погоды', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: contentWidgets[currentContentIndex]),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: changeContent,
                child: Text(
                  'Сменить показатель',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TemperatureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Текущая температура: 25°C',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Ясно',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class AdditionalInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Дополнительная информация о погоде',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class UpdateTimeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Последнее обновление: 12:00 PM',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}