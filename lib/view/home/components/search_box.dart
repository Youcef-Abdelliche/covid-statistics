import 'dart:ui';

import 'package:covid_statistics/models/country_statistics.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SearchBox extends StatefulWidget {
  final List<CountryStatistics> countriesList;
  const SearchBox({
    Key key,
    this.countriesList,
  }) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController editingController = TextEditingController();

  List<CountryStatistics> duplicateItems =[];
    List<CountryStatistics> items=[];

  @override
  void initState() {
    super.initState();
    setState(() {
      duplicateItems.addAll(widget.countriesList);
      items.addAll(widget.countriesList);
    });
    //print(duplicateItems[2]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(14)),
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(16),
              vertical: getProportionateScreenHeight(5)),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(14),
          ),
          child: TextField(
            controller: editingController,
            onChanged: (value){
              filterSearchResults(value);
              print(items.toString());
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.location_on, color: Colors.grey),
                hintText: "Country Name",
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),
      ],
    );
  }

  void filterSearchResults(String query) {
  List<CountryStatistics> dummySearchList = List<CountryStatistics>();
  dummySearchList.addAll(duplicateItems);
  if(query.isNotEmpty) {
    List<CountryStatistics> dummyListData = List<CountryStatistics>();
    dummySearchList.forEach((item) {
      if(item.name.contains(query)) {
        dummyListData.add(item);
      }
    });
    setState(() {
      items.clear();
      items.addAll(dummyListData);
    });
    return;
  } else {
    setState(() {
      items.clear();
      items.addAll(duplicateItems);
    });
  }
}
}
