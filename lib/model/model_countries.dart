class Countries {
  String name;
  String confirmed;
  String deaths;
  String recovered;

  Countries({this.name, this.confirmed, this.deaths, this.recovered});

  factory Countries.toCountries(Map<String, dynamic> object) {
    return Countries(
      name: object['Country_Region'],
      confirmed: object['Confirmed'].toString(),
      deaths: object['Deaths'].toString(),
      recovered: object['Recovered'].toString(),
    );
  }
}