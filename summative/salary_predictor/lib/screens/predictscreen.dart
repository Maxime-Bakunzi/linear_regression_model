import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PredictScreen extends StatefulWidget {
  @override
  _PredictScreenState createState() => _PredictScreenState();
}

class _PredictScreenState extends State<PredictScreen> {
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phdController = TextEditingController();
  String salaryPrediction = "Not predicted yet";
  String errorMessage = "";

  Future<void> getPrediction(int gender, int age, int phd) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://linear-regression-model-n8bu.onrender.com/predict'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({'Gender': gender, 'Age': age, 'PhD': phd}),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        double prediction = responseBody['prediction'];
        setState(() {
          salaryPrediction = '\$${(prediction).toStringAsFixed(2)}k USD';
        });
      } else {
        setState(() {
          salaryPrediction = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        salaryPrediction = 'Error: $e';
      });
    }
  }

  void predictSalary() {
    setState(() {
      errorMessage = "";
    });

    if (genderController.text != '0' && genderController.text != '1') {
      setState(() {
        errorMessage = "Gender must be 0 or 1";
      });
      return;
    }

    if (phdController.text != '0' && phdController.text != '1') {
      setState(() {
        errorMessage = "PhD must be 0 or 1";
      });
      return;
    }

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
            image: AssetImage('lib/assets/screen2.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.darken,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 40),
                        buildTextField(
                          controller: genderController,
                          label: 'Gender',
                          hint: '0 for Female, 1 for Male',
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[01]'))
                          ],
                        ),
                        SizedBox(height: 20),
                        buildTextField(
                          controller: ageController,
                          label: 'Age',
                          hint: 'Enter your age',
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                        SizedBox(height: 20),
                        buildTextField(
                          controller: phdController,
                          label: 'PhD',
                          hint: '0 for no PhD, 1 for PhD',
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[01]'))
                          ],
                        ),
                        SizedBox(height: 10),
                        if (errorMessage.isNotEmpty)
                          Text(
                            errorMessage,
                            style: TextStyle(color: Colors.red, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: predictSalary,
                          child: Text('Predict Salary'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xdb050523),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            textStyle: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Predicted Salary:',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                salaryPrediction,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xdb050523),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: inputFormatters,
    );
  }
}
