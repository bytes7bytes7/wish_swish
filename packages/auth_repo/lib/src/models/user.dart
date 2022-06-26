class User {
  const User({
    required this.id,
    required this.name,
    required this.surname,
    this.avatar = '',
  });

  final String id;
  final String name;
  final String surname;
  final String avatar;
}
