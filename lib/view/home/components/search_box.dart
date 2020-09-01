import 'package:covid_statistics/services/covid_service.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(getProportionateScreenHeight(18)),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(16),
          vertical: getProportionateScreenHeight(5)),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(Icons.search, color: Colors.grey),
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }
}

class CoutriesList extends StatelessWidget {
  const CoutriesList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      //future: CovidService().getCovidCountriesStatistics(),
      future: CovidService().getCovidWorldStatistics(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text("Loading..."));
        } else {
          if (snapshot.hasData) {
            return Container();
            /*return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(snapshot.data[index].flagUrl,
                        height: 50, width: 50),
                    title: Text(snapshot.data[index].name),
                  );
                });*/
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else
            return Center(
              child: Text("No data"),
            );
        }
      },
    );
  }
}
