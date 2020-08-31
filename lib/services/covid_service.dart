import 'dart:convert';
import 'package:covid_statistics/models/world_statistics.dart';
//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CovidService {
  Future<WorldStatistics> getCovidWorldStatistics() async {
    final response = await http.get("https://disease.sh/v3/covid-19/all");
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("Status: 200 OK");
      return WorldStatistics.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load statistics');
    }
  }
}
