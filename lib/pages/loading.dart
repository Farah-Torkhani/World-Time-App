import 'package:flutter/material.dart';
import '../services/world_time.Dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();
    // Load data and navigate to the home page
    setupWorldTime();
  }

  void setupWorldTime() async {
    try {
      WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
      await instance.getTime();
      setState(() {
        // Store the data in the local variable
        data = {
          'location': instance.location,
          'flag': instance.flag,
          'time': instance.time,
          'isDayTime': instance.isDaytime,
        };
      });
      // Navigate to the home page
      Navigator.pushReplacementNamed(context, '/home', arguments: data);
    } catch (e) {
      print('Error loading data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
