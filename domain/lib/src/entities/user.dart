class User{
  final String name;
  final String id;
  final String email;

  User({
    required this.name,
    required this.email,
    required this.id,
  });

  User copyWith({
    String? name,
    String? email,
    String? id,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
    );
  }
}