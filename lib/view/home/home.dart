import 'package:covid_statistics/models/country_statistics.dart';
import 'package:covid_statistics/models/world_statistics.dart';
import 'package:covid_statistics/services/covid_service.dart';
import 'package:covid_statistics/view/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WorldStatistics worldStatistics;

  List<CountryStatistics> coutriesList;

  @override
  void initState() {
    super.initState();
    CovidService().getCovidWorldStatistics().then((statistics) {
      setState(() {
        worldStatistics = statistics;
      });
    });
    CovidService().getCovidCountriesStatistics().then((list) {
      setState(() {
        coutriesList = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (worldStatistics != null && coutriesList != null)
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.short_text,
                size: 40,
                color: Colors.grey,
              ),
              onPressed: () {}),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 6),
                child: IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.yellow[600],
                    ),
                    onPressed: () {}))
          ],
        ),
        body: Body(
          coutriesList: coutriesList,
          worldStatistics: worldStatistics,
        ),
      );
    else
      return Scaffold(body: LoadingScreen());
  }
}
