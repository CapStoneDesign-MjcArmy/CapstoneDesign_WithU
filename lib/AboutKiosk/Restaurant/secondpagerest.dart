import 'package:flutter/material.dart';
import 'paidpagerest.dart';

class RestSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              '카드를 입력해주세요.',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Container(
            child: Image.asset('assets/images/card.png'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RestPaidPage()),
              );
            },
            child: Text('결제 완료하기'),
          ),
        ],
      ),
    );
  }
}
