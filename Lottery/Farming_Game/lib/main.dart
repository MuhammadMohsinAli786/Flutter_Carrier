import 'package:flutter/material.dart';
import 'package:farming_game/lib/first_screen.dart';
import 'package:farming_game/lib/second_screen.dart';
// Import other screen files as necessary

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        FirstScreen.routeName: (ctx) => FirstScreen(),
        SecondScreen.routeName: (ctx) => SecondScreen(),
        // Define routes for other screens here
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, FirstScreen.routeName);
              },
              child: Text('First Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, SecondScreen.routeName);
              },
              child: Text('Second Screen'),
            ),
            // Add more buttons for other screens
          ],
        ),
      ),
    );
  }
}
