import 'package:flutter/material.dart';

import '../../../../size_config.dart';

class CategoryContainer extends StatefulWidget {
  final String text;
  final int number;
  final Color color;
  const CategoryContainer({
    Key key,
    this.text,
    this.number,
    this.color,
  }) : super(key: key);

  @override
  _CategoryContainerState createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: getProportionateScreenHeight(120),
      width: getProportionateScreenWidth(160),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadiusDirectional.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
       
            blurRadius: 4,
            offset: Offset(0, 1),// changes position of shadow
          ),
        ],
      ),
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
                  fontSize: getProportionateScreenHeight(22))),
        ],
      ),
    );
  }
}
