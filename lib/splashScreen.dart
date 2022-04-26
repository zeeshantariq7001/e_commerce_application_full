import 'dart:async';

import 'package:e_commerce_application_full/models/authprovider.dart';
import 'package:e_commerce_application_full/homepage.dart';
import 'package:e_commerce_application_full/loginpage.dart';
import 'package:e_commerce_application_full/screens/Mainscree.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashInitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return LogInPage();
          } else if (snapshot.data.phoneNumber != null) {}
          return SplashScreen();
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  static const id = "splashpage";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, MainPage.id);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(child: Image.asset("images/baglogo.png")),
          Text(
            "SHOP BIZ",
            style: TextStyle(fontSize: 30, fontFamily: 'Students'),
          ),
          Expanded(child: Center(child: CircularProgressIndicator())),
        ],
      ),
    );
  }
}
