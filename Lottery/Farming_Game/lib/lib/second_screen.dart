import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  static const String routeName = '/second-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Text('This is the second screen'),
      ),
    );
  }
}
