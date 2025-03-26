import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:task/bmiApp.dart';
import 'package:task/homePage.dart';
import 'package:task/mapList.dart';
import 'package:task/namePage.dart';
import 'package:task/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Hello World',
      // theme: ThemeData(primarySwatch: Colors.orange),
      home: Namepage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Title")),
      body: Container(
        color: Colors.amberAccent,
        child: Center(child: Text('Hello, World!')),
      ),
    );
  }
}
