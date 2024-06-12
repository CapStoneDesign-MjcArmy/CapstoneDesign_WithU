import 'package:flutter/material.dart';
import 'package:withu/AboutKiosk/Cafe/kiosk_cafe_main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CafeKiosk extends StatelessWidget {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: '미구현',
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.grey,
                      fontSize: 25,
                      textColor: Colors.white,
                      toastLength: Toast.LENGTH_LONG,
                    );
                  },
                  child: Text(
                    '브랜드 카페',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => KioskCafeMain()),
                    );
                  },
                  child: Text(
                    '일반 카페',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Text(
              '언제나 당신 곁에 함께',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
