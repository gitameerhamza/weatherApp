import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/weatherforecast.dart';
import 'package:http/http.dart' as http;

import 'keys.dart';
class Hourly_Forecast extends StatelessWidget {
  Hourly_Forecast({
    super.key,
  });
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
        
        var temp=data?['list'][1]['main']['temp']- 273.15;
        var des1=data?['list'][1]['weather'][0]['main'];
        var temp2=data?['list'][2]['main']['temp']- 273.15;
        var des2=data?['list'][2]['weather'][0]['main'];
        var temp3=data?['list'][3]['main']['temp']- 273.15;
        var des3=data?['list'][3]['weather'][0]['main'];
        var temp4=data?['list'][3]['main']['temp']- 273.15;
        var des4=data?['list'][3]['weather'][0]['main'];
        var temp5=data?['list'][3]['main']['temp']- 273.15;
        var des5=data?['list'][3]['weather'][0]['main'];
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
                  Weatherforecastitem('${temp.toStringAsFixed(1)}°C', '9:00', iconcondition(des1)),
                  Weatherforecastitem('${temp2.toStringAsFixed(1)}°C', '12:00',iconcondition(des2)),
                  Weatherforecastitem('${temp3.toStringAsFixed(1)}°C', '03:00', iconcondition(des3)),
                  Weatherforecastitem('${temp5.toStringAsFixed(1)}°C', '06:00', iconcondition(des4)),
                  Weatherforecastitem('${temp5.toStringAsFixed(1)}°C', '09:00', iconcondition(des4)),
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
