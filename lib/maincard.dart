
import 'dart:ui';

import 'package:flutter/material.dart';

class maincard extends StatelessWidget {
  const maincard({
    super.key,
  });
  final String Temperature='34.0 °C';
  final Time ='9:00';
  @override
  Widget build(BuildContext context) {
    return Card(
        borderOnForeground: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        clipBehavior: Clip.hardEdge,
        color: Colors.blueGrey,
        elevation: 23,
        margin: const EdgeInsets.all(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  Temperature,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                const Icon(
                  Icons.cloud,
                  size: 99,
                  color: Color.fromARGB(255, 155, 155, 155),
                ),
                Text(
                  Time,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 23),
                )
              ],
            ),
          ),
        ));
  }
}