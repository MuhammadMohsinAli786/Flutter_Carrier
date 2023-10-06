import 'package:flutter/material.dart';
import 'package:untitled2/Screen2.dart';
import 'package:untitled2/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: Homescreen.id,
        routes: {
          Homescreen.id: (context) => Homescreen(),
          screen2.id: (context)=>screen2()
        },
        //home: const Homescreen(),
    );
  }
}