// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class aditionalinfoitem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const aditionalinfoitem(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          size: 40,
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          height: 9,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          value,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ],
    );
  }
}
