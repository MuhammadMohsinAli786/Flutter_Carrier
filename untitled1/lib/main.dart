import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("MY APP"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 250,
              width: 250,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.pink, width: 1),
                  image: const DecorationImage(
                    image: NetworkImage('https://www.pexels.com/photo/mother-and-a-daughter-touching-each-others-noses-17049455/'),
                    fit: BoxFit.fill
                  ),
                  boxShadow: const [
                    BoxShadow(color: Colors.blue, blurRadius: 10)
                  ]),
              child: const Center(child: Text('Login 1')),
            ),
          )
        ],
      ),
    ));
  }
}
