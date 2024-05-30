import 'package:flutter/material.dart';
import '../AboutKiosk/cafe_kiosk.dart';

class KioskInfo extends StatelessWidget {
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CafeKiosk()),
                    );
                  },
                  child: Text('음식점',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                    ),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 200),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    //카페 페이지 라우팅
                  },
                  child: Text('카페',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                    ),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 200),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //무인민원발급기 페이지 라우팅
                  },
                  child: Text('무인민원발급기',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                    ),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 200),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // ktx/열차 페이지 라우팅
                  },
                  child: Text('KTX / 열차', style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                    ),),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 200),
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