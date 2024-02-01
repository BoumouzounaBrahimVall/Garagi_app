import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

enum UserRole { client, manager }

class User {
  final int id;
  final String email;
  final String phoneNumber;
  final bool isActive;
  final UserRole role;
  final int userId;
  final String token;
  static User? instance;
  static String key = 'user';
  User({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.isActive,
    required this.role,
    required this.userId,
    required this.token,
  });
  // to get a single instance of the user for an app
  static Future<User?> getInstance() async {
    if (instance == null) {
      instance = await User.getUserFromSharedPreferences();
      print(instance);
    }
    return instance;
  }

  // Convert the User object to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'phoneNumber': phoneNumber,
      'isActive': isActive,
      'role': getRoleAsTextFromEnum(role),
      'userId': userId,
      'token': token,
    };
  }

  static UserRole getRoleFromText(String text) {
    switch (text) {
      case "USER":
        return UserRole.client;
      default:
        return UserRole.manager;
    }
  }

  static String getRoleAsTextFromEnum(UserRole text) {
    switch (text) {
      case UserRole.client:
        return "USER";
      default:
        return 'MANAGER';
    }
  }

  @override
  String toString() {
    return 'id: $id, email: $email, phoneNumber: $phoneNumber, isActive: $isActive, role: $role, userId: $userId }';
  }

  // Create a User object from a Map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      isActive: map['isActive'],
      role: getRoleFromText(map['role']),
      userId: map['userId'],
      token: map['token'],
    );
  }

  // Store the User object in SharedPreferences
  static Future<void> saveUserToSharedPreferences(User user) async {
    final prefs = await SharedPreferences.getInstance();

    // Convert the User object to a JSON string
    final userJson = jsonEncode(user.toMap());

    // Store the JSON string in SharedPreferences
    prefs.setString(key, userJson);
    instance = user;
  }

// Retrieve the User object from SharedPreferences
  static Future<User?> getUserFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve the JSON string from SharedPreferences
    final userJson = prefs.getString(key);

    // If the JSON string is null, return null
    if (userJson == null) {
      return null;
    }

    // Convert the JSON string to a Map
    final userMap = jsonDecode(userJson);

    // Create a User object from the Map
    return User.fromMap(userMap);
  }

  // Remove the User data from SharedPreferences
  static Future<void> removeUserFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    instance = null;
    // Remove the data associated with the 'user' key
    prefs.remove(key);
  }
}
