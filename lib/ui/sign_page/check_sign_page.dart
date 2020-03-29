import 'package:flutter/material.dart';
import 'package:fluttercodelabswithfirebase/ui/login/login_page.dart';

class CheckSignPage extends StatefulWidget {
  static const routes = "CHECK_SIGN_IN";
  @override
  _CheckSignPageState createState() => _CheckSignPageState();
}

class _CheckSignPageState extends State<CheckSignPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, LoginPage.routes);
            },
            child: Text("LOGIN"),
          ),
        ),
      )
    );
  }
}
