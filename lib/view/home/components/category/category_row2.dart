import 'package:flutter/material.dart';

import '../../../../size_config.dart';

class CategoryConatiner2 extends StatefulWidget {
  final String text;
  final int number;
  final Color color;
  const CategoryConatiner2({
    Key key,
    this.text,
    this.number,
    this.color,
  }) : super(key: key);

  @override
  _CategoryConatiner2State createState() => _CategoryConatiner2State();
}

class _CategoryConatiner2State extends State<CategoryConatiner2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: getProportionateScreenHeight(120),
      width: getProportionateScreenWidth(100),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 7,
          offset: Offset(0, 1), // changes position of shadow
        ),
      ], color: widget.color, borderRadius: BorderRadiusDirectional.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.text,
            style: TextStyle(color: Colors.white),
          ),
          Text(widget.number.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenHeight(16))),
        ],
      ),
    );
  }
}
