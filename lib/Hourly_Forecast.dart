// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
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
              const SizedBox(height: 8),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    index++;
                    final hourlyForecast = data?['list'][index + 1];
                    final hourlySky =
                        data?['list'][index + 1]['weather'][0]['main'];
                    final hourlyTemp = (hourlyForecast['main']['temp'] - 275)
                        .toStringAsFixed(1);
                    final time = DateTime.parse(hourlyForecast['dt_txt']);
                    return HourlyForecast_item(
                      //always fucking return
                      Time: DateFormat.j().format(time),
                      Temperature: hourlyTemp,
                      icon: hourlySky == 'Clouds' || hourlySky == 'Rain'
                          ? Icons.cloud
                          : Icons.sunny,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
