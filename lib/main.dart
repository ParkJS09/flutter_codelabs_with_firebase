import 'package:flutter/material.dart';
import 'package:fluttercodelabswithfirebase/ui/count_page/count_page.dart';
import 'package:fluttercodelabswithfirebase/ui/home_page/home_page.dart';
import 'package:fluttercodelabswithfirebase/ui/login/login_page.dart';
import 'package:fluttercodelabswithfirebase/ui/sign_page/check_sign_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Names',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routes,
      routes: {
        HomePage.routes: (context) => HomePage(),
        CheckSignPage.routes: (context) => CheckSignPage(),
        LoginPage.routes: (context) => LoginPage(),
        CountPage.routes: (context) => CountPage(),
      },
    );
  }
}


