
import 'package:covid_statistics/size_config.dart';
import 'package:flutter/material.dart';


class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}

