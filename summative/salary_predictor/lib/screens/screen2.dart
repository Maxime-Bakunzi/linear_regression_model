import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phdController = TextEditingController();
  String salaryPrediction = "Value";

  void predictSalary() async {
    final response = await http.post(
      Uri.parse(
          'https://linear-regression-model-n8bu.onrender.com/predict'), // Ensure this URL is correct
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'gender': int.parse(genderController.text),
        'age': int.parse(ageController.text),
        'phd': int.parse(phdController.text),
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        salaryPrediction =
            json.decode(response.body)['predicted_salary'].toString();
      });
    } else {
      // Handling errors
      setState(() {
        salaryPrediction = 'Error: ${response.statusCode}';
      });
      print('Failed to predict salary: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'lib/assets/screen2.png'), // Ensure your image path is correct
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: genderController,
                decoration: InputDecoration(
                  labelText: 'Gender',
                  hintText: 'Input (0 for Female or 1 for Male)',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(
                  labelText: 'Age',
                  hintText: 'Input your age',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: phdController,
                decoration: InputDecoration(
                  labelText: 'PhD',
                  hintText: 'Input (0 for no PhD or 1 for PhD)',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: predictSalary,
                  child: Text('Predict'),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Salary: $salaryPrediction',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
