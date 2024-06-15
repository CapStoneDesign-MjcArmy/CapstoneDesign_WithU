import 'package:flutter/material.dart';
import 'kiosk_cafe_main.dart';
import 'package:withu/AboutKiosk/kiosk_info.dart';

class PaidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paid Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              '결제가 완료되었습니다.',
              style: TextStyle(fontSize: 24),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KioskInfo()),
              );
            },
            child: Text('처음화면으로 돌아가기'),
          ),
        ],
      ),
    );
  }
}
