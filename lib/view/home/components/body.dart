/*import 'package:covid_statistics/models/country_statistics.dart';
import 'package:covid_statistics/models/world_statistics.dart';*/
import 'package:covid_statistics/services/covid_service.dart';
import 'package:covid_statistics/size_config.dart';
import 'package:flutter/material.dart';

import 'search_box.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isTotalSelected = true;
  bool isTodaySelected = false;
  bool isYesterdaySelected = false;
  /*WorldStatistics _totalWorldStatistics;
  WorldStatistics _todayWorldStatistics;
  WorldStatistics _yesterdayWorldStatistics;*/

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16),
                  vertical: getProportionateScreenHeight(5)),
              margin: EdgeInsets.only(left: getProportionateScreenHeight(18)),
              child: Text("Statistics",
                  style: TextStyle(
                      fontSize: getProportionateScreenHeight(18),
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            SearchBox(),
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
                  FutureBuilder(
                    future: CovidService().getCovidWorldStatistics(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading...");
                      } else {
                        if (snapshot.hasError)
                          return Text(snapshot.error);
                        else if (snapshot.hasData) {
                          if (isTotalSelected)
                            return Text(snapshot.data.totalCases.toString());
                          else if (isTodaySelected)
                            return Text("Today");
                          else
                            return Text("Yesterday");
                        } else
                          return Text("No data");
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextNotSelected extends StatelessWidget {
  final String text;
  const TextNotSelected({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Colors.grey));
  }
}

class TextSelected extends StatelessWidget {
  final String text;
  const TextSelected({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: getProportionateScreenHeight(14),
            fontWeight: FontWeight.bold,
            color: Colors.black));
  }
}
