import 'package:flutter/material.dart';

import '../../../../size_config.dart';



class TextSelected extends StatefulWidget {
  final String text;
  const TextSelected({Key key, this.text}) : super(key: key);

  @override
  _TextSelectedState createState() => _TextSelectedState();
}

class _TextSelectedState extends State<TextSelected> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: TextStyle(
            fontSize: getProportionateScreenHeight(14),
            fontWeight: FontWeight.bold,
            color: Colors.black));
  }
}