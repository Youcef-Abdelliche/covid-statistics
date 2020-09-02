
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(getProportionateScreenHeight(18)),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(16),
          vertical: getProportionateScreenHeight(5)),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(Icons.search, color: Colors.grey),
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }
}