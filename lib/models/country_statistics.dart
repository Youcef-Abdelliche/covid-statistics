class CountryStatistics {
  final int updated;
  final String name;
  final String flagUrl;
  final String continent;
  final int totalCases;
  final int newCases;
  final int totalDeaths;
  final int newDeaths;
  final int totalRecovered;
  final int newRecovered;
  final int active;
  final int critical;

  // Constructor
  CountryStatistics({
    this.updated,
    this.name,
    this.flagUrl,
    this.continent,
    this.totalCases,
    this.newCases,
    this.totalDeaths,
    this.newDeaths,
    this.totalRecovered,
    this.newRecovered,
    this.active,
    this.critical,
  });
}
