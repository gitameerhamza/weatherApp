// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:flutter/material.dart';

class maincard extends StatelessWidget {
  final String Temperature;
  final IconData icon;
  final String status;
  const maincard({
    super.key,
    required this.Temperature,
    required this.icon,
    required this.status,
  });
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  Temperature,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                Icon(
                  icon,
                  size: 89,
                  color: Colors.white,
                ),
                Text(
                  status,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 23),
                )
              ],
            ),
          ),
        ));
  }
}
