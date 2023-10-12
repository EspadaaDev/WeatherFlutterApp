import 'package:flutter/material.dart';

void main() => runApp(WeaterApp());

class WeaterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("Погода", style: TextStyle(color: Colors.black54)),
            centerTitle: true,
            leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
            iconTheme: IconThemeData(color: Colors.black54),
            actions: [IconButton(onPressed: null, icon: Icon(Icons.settings))],
          ),
          body: _buildBody()),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _headerImage(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _weatherDescription(),
                  Divider(),
                  _temperature(),
                  Divider(),
                  _temperatureForecast(),
                  Divider(),
                  _footerRatings()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Image _headerImage() {
    return const Image(
      image: AssetImage("assets/img/weather_img.jpg"),
      fit: BoxFit.cover,
    );
  }

  Column _weatherDescription() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Воскресенье - 8 октября",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),
        Text(
          "Погода в Волгограде на сегодня, точный прогноз погоды на сегодня для населенного пункта Волгоград, Волгоград (городской округ)",
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  Row _temperature() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.wb_sunny,
              color: Colors.yellow,
            ),
          ],
        ),
        SizedBox(
          width: 16.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "15С, ясно",
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Волгоградская область",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Wrap _temperatureForecast() {
    return Wrap(
      spacing: 10.0,
      children: List.generate(7, (int index) {
        return Chip(
          label: Text(
            '${index + 20}°C',
            style: TextStyle(fontSize: 15.0),
          ),
          avatar: Icon(
            Icons.wb_cloudy,
            color: Colors.blue.shade300,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          side: BorderSide(color: Colors.grey),
          backgroundColor: Colors.grey.shade100,
        );
      }),
    );
  }

  Row _footerRatings() {
    var stars = Row(
      children: [
        Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
        Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
        Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
        Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
        Icon(Icons.star, size: 15.0, color: Colors.grey),
      ],
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Информация с сервиса "Отзовник.ру"',
          style: TextStyle(fontSize: 15.0),
        ),
        stars
      ],
    );
  }
}
