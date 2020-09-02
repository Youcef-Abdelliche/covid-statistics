import 'package:covid_statistics/models/country_statistics.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class SearchScreen extends StatefulWidget {
  final List<CountryStatistics> countriesList;
  const SearchScreen({
    Key key,
    this.countriesList,
  });
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController editingController = TextEditingController();

  List<CountryStatistics> duplicateItems = [];
  List<CountryStatistics> items = [];

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
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Search Countries",
            style: TextStyle(color: Color(0xff1c2d71)),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(14)),
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16),
                    vertical: getProportionateScreenHeight(5)),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TextField(
                  //textCapitalization: TextCapitalization.characters,
                  //keyboardType: TextInputType.,
                  controller: editingController,
                  onChanged: (value) {
                    filterSearchResults(value);
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.location_on, color: Colors.grey),
                      hintText: "Country Name",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    children: List.generate(
                        items.length,
                        (index) => GestureDetector(
                              child: ListTile(
                                leading: Image.network(
                                  items[index].flagUrl,
                                  height: getProportionateScreenHeight(40),
                                  width: getProportionateScreenWidth(40),
                                ),
                                title: Text(items[index].name),
                              ),
                              onTap: () {
                                showDialog(
                                    context: (context),
                                    builder: (context) {
                                      return buildAlertDialog(items[index]);
                                    });
                              },
                            ))),
              )
            ],
          ),
        ));
  }

  void filterSearchResults(String query) {
    List<CountryStatistics> dummySearchList = List<CountryStatistics>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<CountryStatistics> dummyListData = List<CountryStatistics>();
      dummySearchList.forEach((item) {
        //   String text = query.replaceFirst(query[0], query[0].toUpperCase());
        if (item.name.contains(query)) {
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

  AlertDialog buildAlertDialog(CountryStatistics countryStatistics) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      backgroundColor: Colors.grey[50],
      title: ListTile(
        leading: Image.network(
          countryStatistics.flagUrl,
          height: getProportionateScreenHeight(40),
          width: getProportionateScreenWidth(40),
        ),
        title: Text(countryStatistics.name),
      ),
      content: buildCountryContainer(countryStatistics),
    );
  }

  Column buildCountryContainer(CountryStatistics countryStatistics) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffffbd4c),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffffbd4c).withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3) // changes position of shadow
                              )
                        ])),
              ),
              Center(
                  child: Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Text(
                        'Confirmed:',
                        style: TextStyle(color: Color(0xffffbd4c)),
                      )))
            ],
          ),
          title: Text(countryStatistics.totalCases.toString() +
              "(+" +
              countryStatistics.newCases.toString() +
              ")"),
        ),
        ListTile(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffff5959),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffff5959).withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3) // changes position of shadow
                              )
                        ])),
              ),
              Center(
                  child: Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Text(
                        'Deaths:',
                        style: TextStyle(color: Color(0xffff5959)),
                      )))
            ],
          ),
          title: Text(countryStatistics.totalDeaths.toString() +
              "(+" +
              countryStatistics.newDeaths.toString() +
              ")"),
        ),
        ListTile(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff4cd97b),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff4cd97b).withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3) // changes position of shadow
                              )
                        ])),
              ),
              Center(
                  child: Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Text(
                        'Recovered:',
                        style: TextStyle(color: Color(0xff4cd97b)),
                      )))
            ],
          ),
          title: Text(countryStatistics.totalRecovered.toString() +
              "(+" +
              countryStatistics.newRecovered.toString() +
              ")"),
        ),
        ListTile(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff4cb5ff),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff4cb5ff).withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3) // changes position of shadow
                              )
                        ])),
              ),
              Center(
                  child: Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Text(
                        'Active:',
                        style: TextStyle(color: Color(0xff4cb5ff)),
                      )))
            ],
          ),
          title: Text(countryStatistics.active.toString()),
        ),
      ],
    );
  }
}
