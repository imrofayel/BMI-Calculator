import 'package:bmi_calculator/home.dart';
import 'package:flutter/material.dart';

void main(){
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      
      debugShowCheckedModeBanner: false,

      home: const Home(),

      theme: ThemeData(

        fontFamily: "Inter",

        cardColor: Colors.black.withOpacity(0.8),

      ),

    );
  }
}