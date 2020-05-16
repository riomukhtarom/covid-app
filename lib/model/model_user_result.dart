class UserResult {
  String id;
  String name;
  String job;
  String created;

  UserResult({this.id, this.name, this.job, this.created});

  factory UserResult.toUserResult(Map<String, dynamic> object) {
    return UserResult(
      id: object['id'],
      name: object['name'],
      job: object['job'],
      created: object['createdAt'],
    );
  }
}
