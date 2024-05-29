import 'package:flutter/material.dart';
import 'dart:async';
import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFACCA69),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('WelTrack', style: TextStyle(fontSize: 50)),
            SizedBox(height: 10), // 로딩바와 텍스트 사이의 간격
            Text('언제나 당신 곁에 함께', style: TextStyle(fontSize: 15)),
            SizedBox(height: 50),
            CircularProgressIndicator(), // 로딩바 추가
          ],
        ),
      ),
    );
  }
}