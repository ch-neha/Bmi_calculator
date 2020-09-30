import 'package:flutter/material.dart';
import 'package:bmi_calculator/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('BMI CALCULATOR'),
          ),
          backgroundColor: Colors.blueGrey[300],
        ),
        body: InputPage(),
      ),
    );
  }
}
