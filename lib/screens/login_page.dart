import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:login_api_authentication/services/user_auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool visibility = true;
  final _loginKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _loginKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _userNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter a valid Username";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "User Name",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: visibility,
              controller: _passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter a valid password';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      visibility = !visibility;
                    });
                  },
                  icon: visibility
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_loginKey.currentState!.validate()) {
                  final authService = AuthService();
                  final userName = _userNameController.text;
                  final password = _passwordController.text;
                  

                  try {
                    final userData = await authService.loginFunction(userName, password);
                    if (userData!=null) {
                      log("userdata ${userData.token}");
                    } else {
                      log("Login failed");
                    }
                  } catch (e) {
                    log("Error during login: $e");
                  }
                }
              },
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
