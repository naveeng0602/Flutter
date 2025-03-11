import 'package:flutter/material.dart';

class PorfileScreen extends StatelessWidget {
  var nameFromHome;

  PorfileScreen(this.nameFromHome);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Container(
        color: Colors.blueGrey.shade400,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Welcome $nameFromHome",
                style: TextStyle(fontSize: 34, color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
