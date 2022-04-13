class User {
  String? name;
  String? lastname;
  String? course;
  String? period;
  String? contact;
  String? email;
  String? id;
  List? applies;
  List? skills;

  User(
      {this.lastname,
      this.period,
      this.contact,
      this.email,
      this.id,
      this.applies,
      this.skills,
      this.name,
      this.course});

  User fromMap(Map<String, dynamic> map) {
    return User(
      name: map["name"] ?? "",
      lastname: map["lastname"] ?? "",
      course: map["curso"] ?? "",
      period: map["period"] ?? "",
      contact: map["contact"] ?? "",
      email: map["email"] ?? "",
      id: map["id"] ?? "",
      applies: map["applies"] ?? <String>[],
      skills: map["skills"] ?? <String>[],
    );
  }
}
