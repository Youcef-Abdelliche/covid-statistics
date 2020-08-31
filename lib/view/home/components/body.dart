import 'package:covid_statistics/models/world_statistics.dart';
import 'package:covid_statistics/services/covid_service.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WorldStatistics>(
      future: CovidService().getCovidWorldStatistics(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text("Loading..."));
        } else {
          if (snapshot.hasData) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data.totalCases.toString()),
                Text(snapshot.data.newCases.toString()),
                Text(snapshot.data.totalDeaths.toString()),
                Text(snapshot.data.newDeaths.toString()),
                Text(snapshot.data.totalRecovered.toString()),
                Text(snapshot.data.newRecovered.toString()),
                Text(snapshot.data.active.toString()),
                Text(snapshot.data.critical.toString()),
              ],
            ));
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
        }
        return null;
      },
    );
  }
}
