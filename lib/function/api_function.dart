import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> login(String username, String password) async {
  final url = 'https://flutter-amr.noviindus.in/api/Login';
  final headers = {
    'Content-Type': 'application/json',
  };
  final body = jsonEncode({
    'username': username,
    'password': password,
  });

  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    print("responsCode${response.statusCode}");
    return true;
  } else {
    // Failed to log in
    print('Failed to log in: ${response.statusCode}');
    return false;
  }
}
