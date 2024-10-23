import 'package:flutter/material.dart';
import 'package:weather_app/additionalinfo.dart';
import 'package:weather_app/maincard.dart';
import 'package:weather_app/weatherforecast.dart';
import 'package:weather_app/appBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // scaffoldBackgroundColor: Colors.white54
          ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 65, 64, 64),
        appBar: appBar(),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: SizedBox(
                width: 479,
                height: 225,
                child: maincard(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 15),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Weather Forecast',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        newwetherCard('34.0 °C','9:00'),
                        newwetherCard('35.0 °C','10:00'),
                        newwetherCard('36.0 °C','11:00'),
                        newwetherCard('37.0 °C','12:00'),
                        newwetherCard('38.0 °C','01:00'),
                        newwetherCard('39.0 °C','02:00')
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 22, top: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Additional Information',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Colors.white),
              ),
            ),
             const additionalinfo()
          ],
        ),
      ),
    );
  }
}
