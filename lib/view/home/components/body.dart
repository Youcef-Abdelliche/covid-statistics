/*import 'package:covid_statistics/models/country_statistics.dart';*/

import 'package:covid_statistics/models/country_statistics.dart';
import 'package:covid_statistics/models/world_statistics.dart';

import 'package:covid_statistics/size_config.dart';
import 'package:covid_statistics/view/search/search.dart';

import 'package:flutter/material.dart';
import 'category/category_row1.dart';
import 'category/category_row2.dart';

class Body extends StatefulWidget {
  final WorldStatistics worldStatistics;
  final List<CountryStatistics> coutriesList;

  const Body({Key key, this.worldStatistics, this.coutriesList})
      : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  int currentPage2 = 0;
  List<CountryStatistics> countriesList;
  bool isGlobalSelected = true;
  bool isAlgeriaSelected = false;
  CountryStatistics algeria;
  String text = "Total";
  @override
  void initState() {
    super.initState();
    setState(() {
      algeria = widget.coutriesList[2];
      widget.coutriesList.sort((a, b) => b.totalCases.compareTo(a.totalCases));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //SearchBox(countriesList: countriesList),
              Container(
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(16),
                    right: getProportionateScreenWidth(16),
                    top: getProportionateScreenHeight(5),
                    bottom: getProportionateScreenHeight(10)),
                child: Text("Statistics",
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(18),
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1c2d71))),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Color(0xffe3e2ef),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (isGlobalSelected)
                        ? SelectedContainer(
                            text: "Global",
                          )
                        : NotSelectedContainer(
                            text: "Global",
                          ),
                    (isAlgeriaSelected)
                        ? SelectedContainer(
                            text: "Algeria",
                          )
                        : NotSelectedContainer(
                            text: "Algeria",
                          ),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(260),
                    child: PageView(
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                          if (value == 0) {
                            isGlobalSelected = true;
                            isAlgeriaSelected = false;
                          }
                          if (value == 1) {
                            isGlobalSelected = false;
                            isAlgeriaSelected = true;
                          }
                          //print("current page: " + currentPage.toString());
                          //if (value == 0) text = "Global Statistics";
                          //if (value == 1) text = "Today's Statistics";
                        });
                      },
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(16)),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CategoryContainer(
                                      text: "Confirmed",
                                      number: widget.worldStatistics.totalCases,
                                      color: Color(0xffffbd4c),
                                    ),
                                    CategoryContainer(
                                      text: "Death",
                                      number:
                                          widget.worldStatistics.totalDeaths,
                                      color: Color(0xffff5959),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CategoryConatiner2(
                                        text: "Recovered",
                                        number: widget
                                            .worldStatistics.totalRecovered,
                                        color: Color(0xff4cd97b)),
                                    CategoryConatiner2(
                                        text: "Active",
                                        number: widget.worldStatistics.active,
                                        color: Color(0xff4cb5ff)),
                                    CategoryConatiner2(
                                        text: "Critical",
                                        number: widget.worldStatistics.critical,
                                        color: Color(0xff8359ff))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(16)),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CategoryContainer(
                                      text: "Confirmed",
                                      number: algeria.totalCases,
                                      color: Color(0xffffbd4c),
                                    ),
                                    CategoryContainer(
                                      text: "Death",
                                      number: algeria.totalDeaths,
                                      color: Color(0xffff5959),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CategoryConatiner2(
                                        text: "Recovered",
                                        number: algeria.totalRecovered,
                                        color: Color(0xff4cd97b)),
                                    CategoryConatiner2(
                                        text: "Active",
                                        number: algeria.active,
                                        color: Color(0xff4cb5ff)),
                                    CategoryConatiner2(
                                        text: "Critical",
                                        number: algeria.critical,
                                        color: Color(0xff8359ff))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        /*Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(16)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CategoryConatiner2(
                                  text: "Confirmed",
                                  number: widget.worldStatistics.newCases,
                                  color: Color(0xffffbd4c)),
                              CategoryConatiner2(
                                  text: "Deaths",
                                  number: widget.worldStatistics.newDeaths,
                                  color: Color(0xffff5959)),
                              CategoryConatiner2(
                                  text: "Recovered",
                                  number: widget.worldStatistics.newRecovered,
                                  color: Color(0xff4cd97b))
                            ],
                          ),
                        ),*/
                      ],
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          2,
                          (index) => Container(
                                margin: EdgeInsets.only(top: 6, right: 5),
                                height: 6,
                                width: currentPage == index ? 20 : 6,
                                decoration: BoxDecoration(
                                    color: currentPage == index
                                        ? Colors.blue
                                        : Color(0xFFD8D8D8),
                                    borderRadius: BorderRadius.circular(3)),
                              )))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(16),
                        vertical: getProportionateScreenHeight(5)),
                    child: Text("Top Countries",
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(18),
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1c2d71))),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(16),
                        vertical: getProportionateScreenHeight(5)),
                    child: PopupMenuButton(
                        onSelected: (value) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SearchScreen(
                                    countriesList: widget.coutriesList,
                                  )));
                        },
                        icon: Icon(Icons.more_horiz,
                            color: Color(0xff1c2d71), size: 30),
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: Text("All Countries"),
                              ),
                            ]),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(16)),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ]),
                        child: SizedBox(
                          height: getProportionateScreenHeight(300),
                          child: PageView.builder(
                            onPageChanged: (value) {
                              setState(() {
                                currentPage2 = value;
                              });
                            },
                            itemCount: 5,
                            itemBuilder: (context, index) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ListTile(
                                  leading: Image.network(
                                    widget.coutriesList[index].flagUrl,
                                    height: getProportionateScreenHeight(40),
                                    width: getProportionateScreenWidth(40),
                                  ),
                                  title: Text(widget.coutriesList[index].name),
                                ),
                                buildCountryContainer(index),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              5,
                              (index) => Container(
                                    margin: EdgeInsets.only(top: 6, right: 5),
                                    height: 6,
                                    width: currentPage2 == index ? 20 : 6,
                                    decoration: BoxDecoration(
                                        color: currentPage2 == index
                                            ? Colors.blue
                                            : Color(0xFFD8D8D8),
                                        borderRadius: BorderRadius.circular(3)),
                                  ))),
                    ],
                  )),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildCountryContainer(int index) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
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
                                offset:
                                    Offset(0, 3) // changes position of shadow
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
            title: Text(widget.coutriesList[index].totalCases.toString() +
                "(+" +
                widget.coutriesList[index].newCases.toString() +
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
                                offset:
                                    Offset(0, 3) // changes position of shadow
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
            title: Text(widget.coutriesList[index].totalDeaths.toString() +
                "(+" +
                widget.coutriesList[index].newDeaths.toString() +
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
                                offset:
                                    Offset(0, 3) // changes position of shadow
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
            title: Text(widget.coutriesList[index].totalRecovered.toString() +
                "(+" +
                widget.coutriesList[index].newRecovered.toString() +
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
                                offset:
                                    Offset(0, 3) // changes position of shadow
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
            title: Text(widget.coutriesList[index].active.toString()),
          ),
        ],
      ),
    );
  }
}

class NotSelectedContainer extends StatelessWidget {
  final String text;
  const NotSelectedContainer({Key key, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: getProportionateScreenHeight(18)),
        ),
      ),
    );
  }
}

class SelectedContainer extends StatelessWidget {
  final String text;
  const SelectedContainer({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff1c2d71),
                fontSize: getProportionateScreenHeight(18)),
          ),
        ),
      ),
    );
  }
}
