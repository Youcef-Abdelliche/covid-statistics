import 'package:covid_statistics/helpers/connectivity_handler.dart';
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

  bool isInternetAvailable = false;

  @override
  void initState() {
    super.initState();
    ConnectivityHandler.checkConnectivity().then((value) {
      setState(() {
        isInternetAvailable = value;
      });
    });
    CovidService.getCovidWorldStatistics().then((statistics) {
      setState(() {
        worldStatistics = statistics;
      });
    });
    CovidService.getCovidCountriesStatistics().then((list) {
      setState(() {
        coutriesList = list;
      });
    });
    
  }

  @override
  Widget build(BuildContext context) {
    if (worldStatistics != null &&
        coutriesList != null &&
        isInternetAvailable)
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
    else if (!isInternetAvailable) {
      return Scaffold(body: Center(child: Text("No internet")));
    } else
      return Scaffold(body: LoadingScreen());
  }
}
