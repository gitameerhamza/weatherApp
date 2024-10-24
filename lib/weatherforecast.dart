import 'package:flutter/material.dart';

SizedBox newwetherCard(String Temperature,String Time,IconData icon) {
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
              Temperature,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            Icon(
              icon,
              size: 54,
              color: const Color.fromARGB(255, 155, 155, 155),
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
