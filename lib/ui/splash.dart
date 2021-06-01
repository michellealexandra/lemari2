import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lemari2/models/models.dart';
import 'package:lemari2/services/services.dart';
import 'dart:async';
import 'package:lemari2/ui/pages.dart';

class Splash extends StatefulWidget {
  static const String routeName = "/splash";
  final Users users;

  Splash({this.users});
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    splashStart();
  }

  splashStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, checkAuth);
  }

  void checkAuth() async {
    Users user = widget.users;
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      Navigator.pushReplacementNamed(context, MainMenu.routeName, arguments: user);
      ActivityServices.showToast(
          "Welcome back " + auth.currentUser.email);
    } else {
      Navigator.pushReplacementNamed(context, Login.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFEFDF),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/icons/logo.png",
            height: 280,
          ),
        ],
      )),
    );
  }
}
