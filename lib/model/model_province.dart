class Province {
  String name;
  String confirmed;
  String deaths;
  String recovered;

  Province({this.name, this.confirmed, this.deaths, this.recovered});

  factory Province.toProvince(Map<String, dynamic> object) {
    return Province(
      name: object['Provinsi'],
      confirmed: object['Kasus_Posi'].toString(),
      deaths: object['Kasus_Meni'].toString(),
      recovered: object['Kasus_Semb'].toString(),
    );
  }
}