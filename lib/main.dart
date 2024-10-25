import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/aditionalinfoitem.dart';
import 'package:weather_app/maincard.dart';
import 'package:weather_app/weatherforecast.dart';
import 'package:weather_app/appBar.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var api='ce46b6d39721df2a2c3bb1d76a42e889';
  
  Future<Map<String,dynamic>> request () async {
    try {
      var url =Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=Lahore&appid=$api');
      var response =await http.get(url);
      final res =jsonDecode(response.body);
      if(res['cod']!='200'){
        throw 'Code futt gya';
      }
      return res;
    } catch (e) {
      throw 'kya kr raha ha bhai';
    }
  }
  @override
  void initState() {
    super.initState();
    request();
  }
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
        body:FutureBuilder(
          future: request() ,
          builder:(context, snapshot) {

            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              ));
            }
            if (snapshot.hasError){
              return Center(child: Text(snapshot.error.toString(),
              style: const TextStyle(color: Colors.white),));
            }
            
            final data = snapshot.data;
            final temperature = data?['list'][0]['main']['temp']- 273.15;
            var maincardstatus=data?['list'][0]['weather'][0]['main'];
            var Pressure = data?['list'][0]['main']['pressure'];
            var windspeed=data?['list'][0]['wind']['speed'];
            var Humidity=data?['list'][0]['main']['humidity'];
            return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 479,
                  height: 225,
                  child: maincard(
                      Temperature: '${temperature.toStringAsFixed(1)} °C', icon: maincardstatus== 'clouds'||maincardstatus=='Rain'?Icons.cloud : Icons.sunny, status: maincardstatus),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          newwetherCard('34.0 °C', '9:00', Icons.cloud),
                          newwetherCard('35.0 °C', '10:00', Icons.sunny),
                          newwetherCard('36.0 °C', '11:00', Icons.air),
                          newwetherCard('37.0 °C', '12:00', Icons.thunderstorm),
                          newwetherCard('38.0 °C', '01:00', Icons.sunny),
                          newwetherCard('39.0 °C', '02:00', Icons.foggy)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 22, top: 13),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Additional Information',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  aditionalinfoitem(
                      icon: Icons.water_drop, label: 'Humidity', value: Humidity.toString()),
                  aditionalinfoitem(
                      icon: Icons.waves, label: 'Wind Speed', value: windspeed.toString()),
                  aditionalinfoitem(
                      icon: Icons.umbrella, label: 'Pressure', value: '$Pressure')
                ],
              )
            ],
          );
          },
        ),
      ),
    );
  }
}
