import 'dart:ui';
import 'package:flutter/material.dart';
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 479,
                height: 225,
                child: Card(
                    borderOnForeground: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    clipBehavior: Clip.hardEdge,
                    color: Colors.blueGrey,
                    elevation: 23,
                    margin: const EdgeInsets.all(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              '34.0 °C',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                            Icon(
                              Icons.cloud,
                              size: 99,
                              color: Color.fromARGB(255, 155, 155, 155),
                            ),
                            Text(
                              '9:00',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 23),
                            )
                          ],
                        ),
                      ),
                    )),
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
             const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 65, top: 20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.water_drop_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Humidty',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text('94',
                      style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                      color: Colors.white) ,)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 55, top: 20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.air_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Wind Speed',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text('7.7',
                      style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                      color: Colors.white) ,)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 55, top: 20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.umbrella_sharp,
                        size: 40,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Wind Speed',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text('1006',
                      style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                      color: Colors.white) ,)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}