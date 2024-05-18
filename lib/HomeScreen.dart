import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('This is the home screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}