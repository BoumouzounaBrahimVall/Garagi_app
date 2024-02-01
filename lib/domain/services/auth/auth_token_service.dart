import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:garagi_app/config/constants.dart';
import 'package:garagi_app/domain/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthentificationService {
  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token ?? '';
  }

  static Future<bool> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString('token', token);
  }

  static Future<bool> login(String email, String password) async {
    String baseUrl = '${AppConstants.backendUrl}/compte/sign-in';
    final Dio _dio = Dio();

    try {
      final response = await _dio.post(
        baseUrl,
        data: '{"email": "$email", "password": "$password"}',
      );
      if (response.statusCode == 200) {
        await User.saveUserToSharedPreferences(User.fromMap(response.data));
        print("here" + User.instance.toString());
        return true;
      } else {
        print("not true");
        return false;
      }
    } on DioException catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<void> logout() async {
    await User.removeUserFromSharedPreferences();
  }
}

/**
{
    "id": 2,
    "email": "brahimvall@gmail.com",
    "phoneNumber": "0695480803",
    "isActive": true,
    "role": "USER",
    "userId": 2,
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImJyYWhpbXZhbGxAZ21haWwuY29tIiwiaWF0IjoxNzA2ODAwNzQyLCJleHAiOjE3MDY4MDI1NDJ9.vP3QfAJY7wbHCZ37Hu9kNKDCf5OEnrdLBzbb94qkw-s"
}

 */