import 'package:covid_statistics/view/home/home.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return HomeScreen();
  }
}
