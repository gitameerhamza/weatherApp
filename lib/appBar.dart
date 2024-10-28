// ignore_for_file: file_names

import 'package:flutter/material.dart';

AppBar appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 65, 64, 64),
      title: const Text(
        'Weather App',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.refresh),
          color: Colors.white,
        )
      ],
    );
  }