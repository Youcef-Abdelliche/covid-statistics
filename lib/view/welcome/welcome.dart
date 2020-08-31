import 'dart:async';
import 'package:covid_statistics/size_config.dart';
import 'package:covid_statistics/view/home/home.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    /*Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    });*/

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/doctor.png",
            height: getProportionateScreenHeight(200),
            width: getProportionateScreenWidth(160),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          Text(
            "Covid Statistics",
            style: TextStyle(
                color: Color(0xFF688BFD),
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenHeight(30)),
          )
        ],
      ),
    ));
  }
}
