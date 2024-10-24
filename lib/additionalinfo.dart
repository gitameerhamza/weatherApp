import 'package:flutter/material.dart';

class additionalinfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const additionalinfo({
    super.key,
    required this.icon,
    required this.label,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Icon(
              size: 40,
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              label,
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              value,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
        Column(
          children: [
            
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.umbrella_sharp,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Wind Speed',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              '1006',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
      ],
    );
  }
}
