import 'package:flutter/material.dart';
import '../AboutKiosk/kiosk_select_main_screen.dart';
import 'package:withu/Camera/camera_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                      MaterialPageRoute(builder: (context) => KioskInfo()),
                    );
                  },
                  child: Text('키오스크 안내',
                      style: TextStyle(
                        fontSize: 20
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
                    Fluttertoast.showToast(
                      msg: '미구현',
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.grey,
                      fontSize: 25,
                      textColor: Colors.white,
                      toastLength: Toast.LENGTH_LONG,
                    );
                  },
                  child: Text('키오스크 찾기',
                    style: TextStyle(
                      fontSize: 20
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
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraScreen(),
                    ),
                  );
                },
                child: Text('키오스크 돋보기''\n''(카메라 켜기)',
                style: TextStyle(
                  fontSize: 20
                ),),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 200),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
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