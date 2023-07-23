import 'package:flutter/material.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments from ModalRoute
    dynamic arguments = ModalRoute.of(context)!.settings.arguments;

    if (arguments != null && arguments is Map) {
      data = arguments;
    } else {
      // Handle the case when arguments are null or not of the expected type
      data = {
        'location': 'Unknown Location',
        'time': 'Unknown Time',
        'isDaytime': true,
      };
    
    }
String bgImage = (data['isDaytime'] ?? false) ? 'day.png' : 'night.png';
Color bgColor =
        (data['isDaytime'] ?? false) ? Colors.blue : Colors.indigo[700]!;

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: <Widget>[
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                    icon: Icon(Icons.edit_location, color: Colors.grey[300]),
               
                label: Text('Edit Location'),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                          color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                      color: Colors.white
                ),
              ),
            ],
          ),
        ),
      ),
)
    );
  }
}
