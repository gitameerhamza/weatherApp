// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'hourlyforecast_item.dart';
import 'keys.dart';

// ignore: camel_case_types
class Hourly_Forecast extends StatelessWidget {
  const Hourly_Forecast({
    super.key,
  });
  Future<Map<String, dynamic>> request() async {
    try {
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=Lahore&appid=$api');
      var response = await http.get(url);
      final res = jsonDecode(response.body);
      if (res['cod'] != '200') {
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
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator.adaptive(
            backgroundColor: Colors.white,
          ));
        }
        final data = snapshot.data;
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
                    
                    for (int i = 1; i < 20; i++)
                      HourlyForecast_item(
                          Temperature:
                              '${(data?['list'][0]['main']['temp']- 273.15).toStringAsFixed(1)} °C',
                          Time: (data?['list'][1]['dt_txt']).toString(),
                          icon: data?['list'][1]['weather'][0]['main']),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
