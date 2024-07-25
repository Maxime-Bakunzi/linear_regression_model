import 'package:flutter/material.dart';
import 'screens/screen1.dart';
import 'screens/screen2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salary Prediction App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Screen1(),
      routes: {
        '/screen1': (context) => Screen1(),
        '/screen2': (context) => Screen2(),
      },
    );
  }
}
