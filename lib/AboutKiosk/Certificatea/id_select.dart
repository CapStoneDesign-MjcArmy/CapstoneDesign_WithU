import 'package:flutter/material.dart';
import 'package:withu/AboutKiosk/Certificatea/certificate_main.dart';

class CertificateSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/backgroundImg.png'), // 백그라운드 이미지 파일 경로 설정
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 50), // 상단 여백
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '발급을 원하시는 ',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      TextSpan(
                        text: '증명서',
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                      TextSpan(
                        text: '를 선택하십시오.',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50), // 텍스트와 버튼 사이 여백
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildCertificateButton(
                          context, '주민등록표(초본)\n', 200, OtherPage()),
                      SizedBox(height: 20),
                      _buildCertificateButton(
                          context, '주민등록표(등본)\n', 200, OtherPage()),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildNavigationButton(context, '첫화면', Icons.home),
                    SizedBox(width: 20),
                    _buildNavigationButton(context, '이전화면', Icons.arrow_back),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  '안녕하세요. 무인민원발급기입니다.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCertificateButton(
      BuildContext context, String text, int price, Widget page) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black87,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // 원하는 둥근 정도 설정
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Text(
            '$price원',
            style: TextStyle(
              fontSize: 14,
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButton(
      BuildContext context, String text, IconData icon) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 30),
      label: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}
