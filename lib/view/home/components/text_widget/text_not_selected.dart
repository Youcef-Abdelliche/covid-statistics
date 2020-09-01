import 'package:flutter/material.dart';

class TextNotSelected extends StatefulWidget {
  final String text;
  const TextNotSelected({Key key, this.text}) : super(key: key);

  @override
  _TextNotSelectedState createState() => _TextNotSelectedState();
}

class _TextNotSelectedState extends State<TextNotSelected> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text, style: TextStyle(color: Colors.grey));
  }
}