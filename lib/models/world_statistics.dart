class WorldStatistics {
  final int totalCases;
  final int newCases;
  final int totalDeaths;
  final int newDeaths;
  final int totalRecovered;
  final int newRecovered;
  final int active;
  final int critical;
  WorldStatistics({
    this.totalCases,
    this.newCases,
    this.totalDeaths,
    this.newDeaths,
    this.totalRecovered,
    this.newRecovered,
    this.active,
    this.critical,
  });

  factory WorldStatistics.fromJson(Map<String, dynamic> json) {
    return WorldStatistics(
        totalCases: json['cases'],
        newCases: json['todayCases'],
        totalDeaths: json['deaths'],
        newDeaths: json['todayDeaths'],
        totalRecovered: json['recovered'],
        newRecovered: json['todayRecovered'],
        active: json['active'],
        critical: json['critical']);
  }
}
