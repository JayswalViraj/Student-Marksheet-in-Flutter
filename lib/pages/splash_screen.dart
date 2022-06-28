import 'dart:async';

import 'package:demo_practical/pages/add_student.dart';
import 'package:demo_practical/utils.dart/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AddStudet()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            child: Image.asset("assets/images/splash_image.png"),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Simple Student Maksheet",
            style: TextStyle(
                color: primeryColor, fontWeight: FontWeight.w500, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Please Note: This is Simple App",
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.w500, fontSize: 20),
          )
        ],
      )),
    );
  }
}
