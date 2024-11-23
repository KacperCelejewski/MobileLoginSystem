final String tableUser = 'User';

class UserFields {
  static final List<String> values = [
    id,email,password,
  ];
  static final String id = '_id';
  static final String email = 'email';
  static final String password = 'password';
}

class User {
  final int? id;
  final String email;
  final String password;

  const User({
    this.id,
    this.email,
    this.password,
  });
  User copy ({
    int? id,
    String? email,
    String? password

}) =>
  User(
    id: id ?? this.id,
    password: password ?? this.password,
    email: email ?? this.email,
  );

  static User fromJson(Map<String, Object?> json) => User(
    id: json[UserFields.id] as int?,
    email: json[UserFields.email]! as String,
    password: json[UserFields.password]! as String,
  );

  Map<String, Object?> toJson() => {
    UserFields.id: id,
    UserFields.email: email,
    UserFields.password: password,

  };
}
