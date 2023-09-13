import 'dart:convert';

// To parse this JSON data, do : final user = userFromJson(jsonString);

User userFromJson(
  String str,
) =>
    User.fromJson(
      json.decode(
        str,
      ),
    );

String userToJson(
  User data,
) =>
    json.encode(
      data.toJson(),
    );

class User {
  User({
    required this.username,
    required this.email,
    this.password,
    required this.phoneNumber,
    required this.dateBirth,
    required this.sexe,
    required this.role,
    this.passwordConfirmation,
  });

  String username;
  String email;
  late String? password;
  String phoneNumber;
  DateTime dateBirth;
  String sexe;
  String role;
  late String? passwordConfirmation;

  factory User.fromJson(
    Map<String, dynamic> json,
  ) =>
      User(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phone_number"],
        dateBirth: DateTime.parse(
          json["date_birth"],
        ),
        sexe: json["sexe"],
        role: json["role"],
        passwordConfirmation: json["password_confirmation"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "phone_number": phoneNumber,
        "date_birth":
            "${dateBirth.year.toString().padLeft(4, '0')}-${dateBirth.month.toString().padLeft(2, '0')}-${dateBirth.day.toString().padLeft(2, '0')}",
        "sexe": sexe,
        "role": role,
        "password_confirmation": passwordConfirmation,
      };
}
