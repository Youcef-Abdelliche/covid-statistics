/*import 'package:covid_statistics/models/country_statistics.dart';*/

import 'package:covid_statistics/models/country_statistics.dart';
import 'package:covid_statistics/models/world_statistics.dart';
import 'package:covid_statistics/services/covid_service.dart';
import 'package:covid_statistics/size_config.dart';
import 'package:flutter/material.dart';
import 'category/category_row1.dart';
import 'category/category_row2.dart';
import 'search_box.dart';
import 'text_widget/text_not_selected.dart';
import 'text_widget/text_selected.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isTotalSelected = true;
  bool isTodaySelected = false;
  bool isYesterdaySelected = false;
  WorldStatistics _totalWorldStatistics;

  @override
  void initState() {
    super.initState();
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
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(60)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (!isTotalSelected)
                              setState(() {
                                isTotalSelected = true;
                                isTodaySelected = false;
                                isYesterdaySelected = false;
                              });
                          },
                          child: (isTotalSelected)
                              ? TextSelected(text: "Total")
                              : TextNotSelected(text: "Total"),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (!isTodaySelected)
                              setState(() {
                                isTotalSelected = false;
                                isTodaySelected = true;
                                isYesterdaySelected = false;
                              });
                          },
                          child: (isTodaySelected)
                              ? TextSelected(text: "Today")
                              : TextNotSelected(text: "Today"),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (!isYesterdaySelected)
                              setState(() {
                                isTotalSelected = false;
                                isTodaySelected = false;
                                isYesterdaySelected = true;
                              });
                          },
                          child: (isYesterdaySelected)
                              ? TextSelected(text: "Yesterday")
                              : TextNotSelected(text: "Yesterday"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16)),
                child: Column(
                  children: [
                    FutureBuilder(
                      future: CovidService().getCovidWorldStatistics(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: Text("Loading..."));
                        } else {
                          if (snapshot.hasError)
                            return Text(snapshot.error);
                          else if (snapshot.hasData) {
                            _totalWorldStatistics = snapshot.data;
                            if (isTotalSelected)
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CategoryContainer(
                                        text: "Confirmed",
                                        number:
                                            _totalWorldStatistics.totalCases,
                                        color: Color(0xffffbd4c),
                                      ),
                                      CategoryContainer(
                                        text: "Death",
                                        number:
                                            _totalWorldStatistics.totalDeaths,
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
                                          number: _totalWorldStatistics
                                              .totalRecovered,
                                          color: Color(0xff4cd97b)),
                                      CategoryConatiner2(
                                          text: "Active",
                                          number: _totalWorldStatistics.active,
                                          color: Color(0xff4cb5ff)),
                                      CategoryConatiner2(
                                          text: "Critical",
                                          number:
                                              _totalWorldStatistics.critical,
                                          color: Color(0xff8359ff))
                                    ],
                                  )
                                ],
                              );
                            else if (isTodaySelected)
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CategoryConatiner2(
                                      text: "Confirmed",
                                      number: _totalWorldStatistics.newCases,
                                      color: Color(0xffffbd4c)),
                                  CategoryConatiner2(
                                      text: "Deaths",
                                      number: _totalWorldStatistics.newDeaths,
                                      color: Color(0xffff5959)),
                                  CategoryConatiner2(
                                      text: "Recovered",
                                      number:
                                          _totalWorldStatistics.newRecovered,
                                      color: Color(0xff4cd97b))
                                ],
                              );
                            else
                              return Text("Yesterday");
                          } else
                            return Text("No data");
                        }
                      },
                    ),
                  ],
                ),
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
                  child: FutureBuilder(
                      future: CovidService().getCovidCountriesStatistics(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: Text("Loading..."));
                        } else {
                          if (snapshot.hasError)
                            return Center(child: Text(snapshot.error));
                          else if (snapshot.hasData) {
                            List<CountryStatistics> coutriesList =
                                snapshot.data;
                            List<ExpansionTile> list = [];
                            for (int index = 0;
                                index < coutriesList.length;
                                index++) {
                              list.add(ExpansionTile(
                                title: Row(
                                  children: [
                                    Image.network(
                                      coutriesList[index].flagUrl,
                                      height: getProportionateScreenHeight(40),
                                      width: getProportionateScreenWidth(40),
                                    ),
                                    SizedBox(
                                        width: getProportionateScreenWidth(10)),
                                    (coutriesList[index].name.length < 15)
                                        ? Text(coutriesList[index].name)
                                        : Text(coutriesList[index]
                                                .name
                                                .substring(0, 15) +
                                            "...")
                                  ],
                                ),
                                children: [
                                  Text(coutriesList[index].newCases.toString())
                                ],
                              ));
                            }
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: list,
                                ),
                              ),
                            );
                          } else
                            return Center(child: Text("No data"));
                        }
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
