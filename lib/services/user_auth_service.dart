import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:login_api_authentication/api/api.dart';
import 'package:login_api_authentication/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<LoginModel?> loginFunction(String username, String password) async {
    final body = {'username': username, 'password': password};
    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.post(
          Uri.parse("${API().baseUrl}${API().autUrl}"),
          body: jsonEncode(body),
          headers: headers);
      
      log('Response body: ${response.body}');
      log('Status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        LoginModel user = LoginModel.fromJson(result);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', user.token.toString());

        log("User Data: ${user.token}");
        return user;
      } else {
        log("Failed to login. Status code: ${response.statusCode}, Response: ${response.body}");
      }
    } catch (error) {
      log("Error during login: $error");
    }
    return null;
  }
}
