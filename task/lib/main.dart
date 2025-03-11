import 'package:flutter/material.dart';
import 'package:task/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Hello World',
      // theme: ThemeData(primarySwatch: Colors.orange),
      home: MyWidget() ,
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
