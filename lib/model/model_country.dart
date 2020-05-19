class Country {
  final String country;
  final String confirm;
  final String deaths;
  final String recovered;

  Country({this.country, this.confirm, this.deaths, this.recovered});

  factory Country.toCountry(Map<String, dynamic> json) {
    return Country(
      country: json["name"],
      confirm: json["positif"].toString(),
      deaths: json["meninggal"].toString(),
      recovered: json["sembuh"].toString(),
    );
  }
}

class CountryUninitialized extends Country{}

class CountryError extends Country{}
