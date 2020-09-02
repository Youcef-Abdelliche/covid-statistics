/*import 'package:covid_statistics/models/country_statistics.dart';*/

import 'dart:convert';

import 'package:covid_statistics/models/country_statistics.dart';
import 'package:covid_statistics/models/world_statistics.dart';
import 'package:covid_statistics/services/covid_service.dart';
import 'package:covid_statistics/size_config.dart';
import 'package:covid_statistics/view/loading/loading_screen.dart';

import 'package:flutter/material.dart';
import 'category/category_row1.dart';
import 'category/category_row2.dart';
import 'search_box.dart';

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
              SearchBox(),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16),
                    vertical: getProportionateScreenHeight(5)),
                margin: EdgeInsets.only(left: getProportionateScreenHeight(18)),
                child: Text("Global",
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(18),
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1c2d71))),
              ),
              Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(260),
                    child: PageView(
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(16)),
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
                                    number: widget.worldStatistics.totalDeaths,
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
                                      number:
                                          widget.worldStatistics.totalRecovered,
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
                        Padding(
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
                        ),
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
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16),
                    vertical: getProportionateScreenHeight(5)),
                margin: EdgeInsets.only(left: getProportionateScreenHeight(18)),
                child: Text("Statistics",
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(18),
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1c2d71))),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: List.generate(
                            widget.coutriesList.length,
                            (index) => ExpansionTile(
                                  title: Row(
                                    children: [
                                      Image.network(
                                        widget.coutriesList[index].flagUrl,
                                        height:
                                            getProportionateScreenHeight(40),
                                        width: getProportionateScreenWidth(40),
                                      ),
                                      SizedBox(
                                          width:
                                              getProportionateScreenWidth(10)),
                                      (widget.coutriesList[index].name.length <
                                              15)
                                          ? Text(
                                              widget.coutriesList[index].name)
                                          : Text(widget.coutriesList[index].name
                                                  .substring(0, 15) +
                                              "...")
                                    ],
                                  ),
                                  children: [
                                    Text(widget.coutriesList[index].newCases
                                        .toString())
                                  ],
                                )),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
