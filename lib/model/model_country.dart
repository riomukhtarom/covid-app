class Country {
  final String country;
  final String confirm;
  final String deaths;
  final String recovered;

  Country(this.country, this.confirm, this.deaths, this.recovered);

  factory Country.toCountry(Map<String, dynamic> json) {
    return Country(
      json["name"],
      json["positif"],
      json["meninggal"],
      json["sembuh"]
    );
  }

}