import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phdController = TextEditingController();
  String _predictedSalary = 'Value';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/assets/screen2.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _genderController,
                  decoration: InputDecoration(
                    labelText: 'Input (0 for Female or 1 for Male)',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _ageController,
                  decoration: InputDecoration(
                    labelText: 'Input your age',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _phdController,
                  decoration: InputDecoration(
                    labelText: 'Input (0 for no PhD or 1 for PhD)',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _predictSalary,
                  child: Text('Predict'),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Salary: $_predictedSalary',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _predictSalary() {
    // Uncomment the following code when the API is ready
    /*
    final gender = int.parse(_genderController.text);
    final age = int.parse(_ageController.text);
    final phd = int.parse(_phdController.text);

    // Call the API
    // final response = await http.post(
    //   Uri.parse('http://yourapiurl/predict'),
    //   body: jsonEncode({
    //     'gender': gender,
    //     'age': age,
    //     'phd': phd,
    //   }),
    // );

    // final data = jsonDecode(response.body);
    // setState(() {
    //   _predictedSalary = data['salary'].toString();
    // });
    */

    // For now, we just simulate the prediction
    setState(() {
      _predictedSalary = 'Simulated Value';
    });
  }
}
