import 'package:flutter/material.dart';
import 'package:login_api_authentication/function/api_function.dart';
import 'package:login_api_authentication/screens/home_page.dart';
import 'login_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;
                bool isLoggedIn = await login(username, password);
                if (isLoggedIn) {
                  // Navigate to the next page or show a success message
print("islogin$isLoggedIn");                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
                } else {
                  // Show an error message
                  print("islogin$isLoggedIn");
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
