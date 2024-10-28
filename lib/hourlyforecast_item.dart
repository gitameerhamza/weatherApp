
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class HourlyForecast_item extends StatelessWidget {
  final Temperature;
  final icon;
  final Time;
  const HourlyForecast_item({

    required this.Temperature,
    required this.icon,
    required this.Time,
    super.key,
  });
  IconData iconcondition(String value) {
    if (value == "clouds" || value == "Rain") {
      return Icons.cloud;
    } else if (value == "Clear") {
      return Icons.sunny;
    }
    return Icons.air;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 123,
        width: 120,
        child: Card(
          color: Colors.blueGrey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  '${Temperature}°C',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                Icon(
                  icon,
                  size: 54,
                  color: Colors.white,
                ),
                Text(
                  Time,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
                )
              ],
            ),
          ),
        ),
      );
  }
}
