class User {
  String id;
  String name;
  String avatar;

  User({this.id, this.name, this.avatar});

  factory User.toUser(Map<String, dynamic> object) {
    return User(
      id: object['id'].toString(),
      name: object['first_name'] + " " + object['last_name'],
      avatar: object['avatar'],
    );
  }
}

class UnitializedUser extends User {}
