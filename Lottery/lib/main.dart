import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Random random=Random();
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lottery App'),
        ),
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                    child: Text('Lottery winning Number is 5', style: TextStyle(fontSize: 50,)),),
                Container(
                  height:x == 5 ? 400 : 250,
                  width: 300,
                  decoration: BoxDecoration(
                    color:  x == 5 ? Colors.teal :  Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)
                        
                  ),
                  child: x == 5 ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.done_all,color: Colors.green,size: 30,),
                      SizedBox(height: 10),
                      Text('Congratulations you have won the lotery \n contact on given number to recive it\n0313_0646071 ',textAlign: TextAlign.center,)
                    ],
                  ):
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.error,color: Colors.red,size: 30,),
                      const SizedBox(height: 10),
                      Text('Better Luck Next Time, Your Number is $x\n Try Again',textAlign: TextAlign.center,)
                    ],
                  ),
                )
              ],
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {

            });
            x= random.nextInt(6);
            print(x);
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}

