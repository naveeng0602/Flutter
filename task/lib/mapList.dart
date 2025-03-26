import 'dart:math';

import 'package:flutter/material.dart';

class mapList extends StatelessWidget {
  var arrData = [
    {'name': "Naveen", 'Mobile': "4434983904", "unread": "2"},
    {'name': "Rahul", 'Mobile': "443498223904", "unread": "4"},
    {'name': 'Sumit', 'Mobile': "4434343904", "unread": "1"},
    {'name': "Rahul", 'Mobile': "443498223904", "unread": "4"},
    {'name': 'Sumit', 'Mobile': "4434343904", "unread": "1"},
  ];

  // const mapList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Map List')),
      ),
      body: Container(
        child: ListView(
          children:
              arrData.map((value) {
                return ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text(value['name'].toString()),
                  subtitle: Text(value['Mobile'].toString()),
                  trailing: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.red,
                    child: Text(value['unread'].toString(),style: TextStyle(color: Colors.black),)),
                );
              }).toList(),
        ),
      ),
    );
  }
}
