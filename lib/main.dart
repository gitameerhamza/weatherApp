import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.white54
      ),
      home:  Scaffold(
        backgroundColor: const Color.fromARGB(255, 65, 64, 64),
        appBar:AppBar(
          backgroundColor: const Color.fromARGB(255, 65, 64, 64),
          title: const  Text('Weather App',
          style: TextStyle(fontWeight: FontWeight.bold,
          color: Colors.white),
          ),
        ) ,
        
        body:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 479,
                height: 225,
                child: Card(
                  borderOnForeground: true,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  clipBehavior: Clip.hardEdge,
                  color: Colors.blueGrey,
                   elevation: 23,
                  margin: const EdgeInsets.all(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 9,sigmaY: 9),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('34.0 °C',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color.fromARGB(255, 255, 255, 255)
                          ),),
                          Icon(Icons.cloud,
                          size: 99,
                          color: Color.fromARGB(255, 155, 155, 155),
                          ),
                          Text('9:00',
                          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),
                    
                          fontSize: 23),
                      )
                        ],
                      ),
                    ),
                  )
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left:15,right: 15),
              child: const Column(
                children: [
                 Align(
                  alignment: Alignment.centerLeft,
                   child: Text('Weather Forecast',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      
                    ),),
                 )
                ],
              ),
            ),
            // Placeholder(),
            // Placeholder(),
          ],
        )
      )
    );
  }
}