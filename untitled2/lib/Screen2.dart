import 'package:flutter/material.dart';

class screen2 extends StatefulWidget {
  static const String id = 'screen2';
  const screen2({super.key});

  @override
  State<screen2> createState() => _screen2State();
}

class _screen2State extends State<screen2> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Drawer'),
        backgroundColor: const Color(0xff764abc),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Expanded(
             child:ListView.builder(
                 itemCount: 100,
                 itemBuilder: (context,Index){
                   return
                     ListTile(
                       leading: const CircleAvatar(
                         backgroundImage:  NetworkImage('https://images.pexels.com/photos/17049455/pexels-photo-17049455/free-photo-of-mother-and-a-daughter-touching-each-others-noses.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                       ),
                       title: const Text('Mohsin Ali'),
                       onTap: (){
                         Navigator.pushNamed(context, screen2.id);
                       },
                     );
                 }
             )
         )
                 ],
      ),
    );
  }
}
