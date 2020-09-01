import 'package:flutter/material.dart';
import '../../size_config.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.short_text,
              size: 40,
              color: Colors.grey,
            ),
            onPressed: () {}),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 6),
              child: IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.yellow[600],
                  ),
                  onPressed: () {}))
        ],
      ),
      body: Body(),
    );
  }
}
