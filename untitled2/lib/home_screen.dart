import 'dart:html';

import 'package:flutter/material.dart';
import 'package:untitled2/Screen2.dart';

class Homescreen extends StatefulWidget {
  static const String id = 'home_screen';
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Drawer'),
        backgroundColor: const Color(0xff764abc),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
            UserAccountsDrawerHeader(
              currentAccountPicture:
              CircleAvatar(
                backgroundImage:  NetworkImage('https://images.pexels.com/photos/17049455/pexels-photo-17049455/free-photo-of-mother-and-a-daughter-touching-each-others-noses.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
              ),
                accountName: Text('Mian SHB'),
                accountEmail: Text('mianmmohsinali@gmail.com')),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('page 1'),
              onTap: (){
                Navigator.pushNamed(context, Homescreen.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate),
              title: Text('page 2'),
              onTap: (){
                Navigator.pushNamed(context, screen2.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: (){
                Navigator.pushNamed(context, screen2.id);
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, screen2.id);
                // Navigator.push(
                //   context, MaterialPageRoute(builder: (context)=>screen2())
                //);
              },
              child: const Text('Screen 1'),
            ),
          )
        ],
      ),
    );
  }
}
