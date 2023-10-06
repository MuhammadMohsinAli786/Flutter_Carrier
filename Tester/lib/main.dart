import 'package:flutter/material.dart';
import 'package:tester/profile1.dart';

void main() {
  runApp(const MyHome());
}
class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileOnePage();

  }
}

