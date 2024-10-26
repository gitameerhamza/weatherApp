import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/weatherforecast.dart';
import 'package:http/http.dart' as http;
class Hourly_Forecast extends StatelessWidget {
  Hourly_Forecast({
    super.key,
  });
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
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: request(),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              ));
            }
        final data = snapshot.data;
        var temp1=data?['list'][0]['main']['temp']- 273.15;
        var des1=data?['list'][0]['weather'][0]['main'];
        return Container(
        margin: const EdgeInsets.only(left: 20, right: 15),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hourly Forecast',
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
                  Weatherforecastitem('${temp1.toStringAsFixed(1)}°C', '9:00', iconcondition(des1)),
                  Weatherforecastitem('35.0 °C', '12:00', Icons.sunny),
                  Weatherforecastitem('36.0 °C', '03:00', Icons.air),
                  Weatherforecastitem('37.0 °C', '06:00', Icons.thunderstorm),
                  Weatherforecastitem('39.0 °C', '09:00', Icons.foggy),
                ],
              ),
            )
          ],
        ),
      );
      },
    );
  }
  IconData iconcondition (String value){
    if(value=="clouds"||value=="Rain"){
      return Icons.cloud;
    }
    else if(value=="Clear"){
      return Icons.sunny;

    }
    return Icons.air;
  }
}
