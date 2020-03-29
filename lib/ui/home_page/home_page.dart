import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttercodelabswithfirebase/ui/count_page/count_page.dart';
import 'package:fluttercodelabswithfirebase/ui/login/login_page.dart';

class HomePage extends StatefulWidget {
  static const routes = "home_page_routes";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData){
          return CountPage();
        }else{
          return LoginPage();
        }
      }
    );
  }
}
