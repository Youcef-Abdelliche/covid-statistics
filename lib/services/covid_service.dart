import 'dart:convert';
import 'package:covid_statistics/models/country_statistics.dart';
import 'package:covid_statistics/models/world_statistics.dart';
//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CovidService {
  // methods
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

  Future<List<CountryStatistics>> getCovidCountriesStatistics() async {
    final response = await http.get("https://disease.sh/v3/covid-19/countries");
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("Status: 200 OK");
      dynamic parsedJson = json.decode(response.body);
      List<CountryStatistics> list = [];
      for (var item in parsedJson) {
        if(item['country'] != "Israel")
        list.add(CountryStatistics(
            updated: item['updated'],
            name: item['country'],
            flagUrl: item['countryInfo']['flag'],
            totalCases: item['cases'],
            newCases: item['todayCases'],
            totalDeaths: item['deaths'],
            newDeaths: item['todayDeaths'],
            totalRecovered: item['recovered'],
            newRecovered: item['todayRecovered'],
            active: item['active'],
            critical: item['critical']));
      }
      return list;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load statistics');
    }
  }
}
