import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter layout demo'), centerTitle: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1471115853179-bb1d604434e0?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with your image path
                width: 1500,
                height: 250,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Oeschinen Lake Campground',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Kandersteg, Switzerland',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.red),
                        Text('41'),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.call, size: 40, color: Colors.blue),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "CALL",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.navigation, size: 40, color: Colors.blue),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "ROUTE",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.share, size: 40, color: Colors.blue),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "SHARE",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Lake Oeschinen lies at the foot of the Bluemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
