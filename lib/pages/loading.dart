import 'package:flutter/material.dart';
import 'package:reloj_mundial/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "loading";

  void navigateToHome(BuildContext context, WorldTime instance) {
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Méxcio', flag: 'mexico.png', url: 'America/Mexico_City');
    await instance.getTime();
    setState(() {
      time = instance.time;
    });
    navigateToHome(context, instance); // Pass context to the navigation method
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
