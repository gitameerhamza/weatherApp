import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // scaffoldBackgroundColor: Colors.white54
            ),
        home: Scaffold(
            backgroundColor: const Color.fromARGB(255, 65, 64, 64),
            appBar: _appBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 479,
                    height: 225,
                    child: Card(
                        borderOnForeground: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        clipBehavior: Clip.hardEdge,
                        color: Colors.blueGrey,
                        elevation: 23,
                        margin: const EdgeInsets.all(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  '34.0 °C',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                Icon(
                                  Icons.cloud,
                                  size: 99,
                                  color: Color.fromARGB(255, 155, 155, 155),
                                ),
                                Text(
                                  '9:00',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 23),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 15),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Weather Forecast',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            newwetherCard(),
                            const SizedBox(width: 10),
                            newwetherCard(),
                            const SizedBox(width: 10),
                            newwetherCard(),
                            const SizedBox(width: 10),
                            newwetherCard(),
                            const SizedBox(width: 10),
                            newwetherCard(),
                            const SizedBox(width: 10),
                            newwetherCard()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // Placeholder(),
                // Placeholder(),
              ],
            )));
  }

  AppBar _appBar() {
    return AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 65, 64, 64),
            title: const Text(
              'Weather App',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            actions: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.refresh),color: Colors.white,)
            ],
          );
  }

  SizedBox newwetherCard() {
    return SizedBox(
      height: 123,
      width: 100,
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.blueGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
        child:  BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2,sigmaY: 2),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  '34.0 °C',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                Icon(
                  Icons.cloud,
                  size: 54,
                  color: Color.fromARGB(255, 155, 155, 155),
                ),
                Text(
                  '9:00',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
