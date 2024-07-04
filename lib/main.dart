import 'package:flutter/material.dart';
import 'package:login_api_authentication/screens/login_page.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:LoginPage() ,
      
    );
  }
}