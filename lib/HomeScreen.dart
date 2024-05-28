import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WithU',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFACCA69),
      ),
      body: Align(
        alignment: Alignment.bottomCenter, // 화면 하단에 배치
        child: Padding(
          padding: const EdgeInsets.all(50.0), // 여백 추가
          child: Text(
            '언제나 당신 곁에 함께',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}