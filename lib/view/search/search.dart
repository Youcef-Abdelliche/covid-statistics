import 'package:covid_statistics/models/country_statistics.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {
                  Scaffold.of(context).showBottomSheet((context) => Container(
                        height: getProportionateScreenHeight(250),
                        width: SizeConfig.screenWidth,
                        decoration: BoxDecoration(color: Colors.grey[900]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Sort by:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        getProportionateScreenHeight(20))),
                            Row(
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: (value) {},
                                ),
                                Text("data",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            getProportionateScreenHeight(20)))
                              ],
                            )
                            /*Container(
                              decoration: BoxDecoration(color: Colors.grey),
                              child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      items.sort( (a, b) => a.name
                                          .toLowerCase()
                                          .compareTo(b.name.toLowerCase()));
                                    });
                                  },
                                  child: Text(
                                    "Continent",
                                    style: TextStyle(color: Colors.black),
                                  )),
                            )*/
                          ],
                        ),
                      ));
                },
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(16),
                    right: getProportionateScreenWidth(16),
                    top: getProportionateScreenHeight(5),
                    bottom: getProportionateScreenHeight(10)),
                child: Text("Search",
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(18),
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1c2d71))),
              ),
              // Search BOX
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
              Container(
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(16),
                    right: getProportionateScreenWidth(16),
                    top: getProportionateScreenHeight(5),
                    bottom: getProportionateScreenHeight(10)),
                child: Text("Continents",
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(18),
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1c2d71))),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(14)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(7, (index) {
                      return GestureDetector(
                        onTap: () {
                          switch (index) {
                            case 0:
                              print("global");
                              filterByContinents("global");
                              break;
                            case 1:
                              print("Africa");
                              filterByContinents("Africa");
                              break;
                            case 2:
                              print("Asia");
                              filterByContinents("Asia");
                              break;
                            case 3:
                              print("Australia/Oceania");
                              filterByContinents("Australia/Oceania");
                              break;
                            case 4:
                              print("Europe");
                              filterByContinents("Europe");
                              break;
                            case 5:
                              print("North America");
                              filterByContinents("North America");
                              break;
                            case 6:
                              print("South America");
                              filterByContinents("South America");
                              break;
                            default:
                          }
                        },
                        child: Container(
                          height: getProportionateScreenHeight(60),
                          width: getProportionateScreenWidth(60),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset("assets/images/continent" +
                              index.toString() +
                              ".png"),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(16),
                    right: getProportionateScreenWidth(16),
                    top: getProportionateScreenHeight(5),
                    bottom: getProportionateScreenHeight(10)),
                child: Text("All Countries",
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(18),
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1c2d71))),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    children: List.generate(
                        items.length,
                        (index) => GestureDetector(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: getProportionateScreenWidth(14),
                                    vertical: getProportionateScreenHeight(4)),
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListTile(
                                  leading: Image.network(
                                    items[index].flagUrl,
                                    height: getProportionateScreenHeight(40),
                                    width: getProportionateScreenWidth(40),
                                  ),
                                  title: Text(items[index].name),
                                ),
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

  void filterByContinents(String continent) {
    List<CountryStatistics> dummySearchList = List<CountryStatistics>();
    List<CountryStatistics> dummyListData = List<CountryStatistics>();
    dummySearchList.addAll(duplicateItems);
    if (continent == "global") {
      dummyListData.addAll(dummySearchList);
    } else {
      dummySearchList.forEach((country) {
        if (country.continent == continent) dummyListData.add(country);
      });
    }
    setState(() {
      items.clear();
      items.addAll(dummyListData);
    });
  }

  void filterSearchResults(String query) {
    List<CountryStatistics> dummySearchList = List<CountryStatistics>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<CountryStatistics> dummyListData = List<CountryStatistics>();
      dummySearchList.forEach((item) {
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
