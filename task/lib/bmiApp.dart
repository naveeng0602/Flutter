import 'package:flutter/material.dart';

class Bmiapp extends StatefulWidget {
  const Bmiapp({super.key});

  @override
  State<Bmiapp> createState() => _BmiappState();
}

class _BmiappState extends State<Bmiapp> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          color: Colors.redAccent,
          height: 30,
          child: Center(child: Text("BMI")),
        ),
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BMI",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    labelText: "Weight (kg)",
                    prefixIcon: Icon(Icons.line_weight),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    labelText: "Height (In Feet)",
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    labelText: "Height (In Inch)",
                    prefixIcon: Icon(Icons.height_sharp),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
