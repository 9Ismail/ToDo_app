import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import './screen/Homepage.dart';

void main() async{
//initialize the Hive

  await Hive.initFlutter();

  //open a box

  var box= await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primarySwatch: Colors.yellow,
      ),
      
    );
  }
}

