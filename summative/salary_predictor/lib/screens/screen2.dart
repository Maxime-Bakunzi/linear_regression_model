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

  Future<void> getPrediction(
    int gender,
    int age,
    int phd,
  ) async {
    try {
      // Make the request to the API, passing the parameters
      http.Response response = await http.post(
        Uri.parse(
            'https://linear-regression-model-n8bu.onrender.com/predict'), // Ensure this URL is correct
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'gender': gender,
          'age': age,
          'phd': phd,
        }),
      );

      // Parse response from json
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        setState(() {
          salaryPrediction = responseBody['predicted_salary'].toString();
        });
      } else {
        setState(() {
          salaryPrediction = 'Error: ${response.statusCode}';
        });
        print('Failed to predict salary: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        salaryPrediction = 'Error: $e';
      });
      print('Error: $e');
    }
  }

  void predictSalary() {
    int gender = int.parse(genderController.text);
    int age = int.parse(ageController.text);
    int phd = int.parse(phdController.text);
    getPrediction(gender, age, phd);
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
