import 'package:flutter/material.dart';

class additionalinfo extends StatelessWidget {
  const additionalinfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 65, top: 20),
          child: Column(
            children: [
              Icon(
                Icons.water_drop_rounded,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Humidty',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                '94',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 55, top: 20),
          child: Column(
            children: [
              Icon(
                Icons.air_outlined,
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
                '7.7',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 55, top: 20),
          child: Column(
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
        ),
      ],
    );
  }
}
