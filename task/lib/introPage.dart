import 'package:flutter/material.dart';
import 'package:task/main.dart';
import 'package:task/my_profile.dart';
// import 'package:helloworld/main.dart';

class introPage extends StatelessWidget {
  var nameController = TextEditingController();
  // const introPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Intro'))),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              
              TextField(controller: nameController),
              SizedBox(height: 11),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PorfileScreen(nameController.text.toString())),
                  );
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}