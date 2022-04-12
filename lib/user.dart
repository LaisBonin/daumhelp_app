class User {
  final String name;
  final String lastname;
  final String course;
  final String period;
  final String contact;
  final String email;
  final String id;
  final List applies;
  final List skills;

  User(
      {required this.lastname,
      required this.period,
      required this.contact,
      required this.email,
      required this.id,
      required this.applies,
      required this.skills,
      required this.name,
      required this.course});
}