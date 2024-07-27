import 'package:flutter/material.dart';
import 'screens/homescreen.dart';
import 'screens/predictscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salary Prediction App',
      theme: ThemeData(
        primaryColor: Color(0xdb050523),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/predict': (context) => PredictScreen(),
      },
    );
  }
}
