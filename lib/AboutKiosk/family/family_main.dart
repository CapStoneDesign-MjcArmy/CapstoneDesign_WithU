import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FamilyMain(),
      routes: {
        '/other': (context) => OtherPage(),
      },
    );
  }
}

class FamilyMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundImg.png'), // 배경 이미지를 여기에 추가하세요
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 30),
            Text(
              '발급을 원하시는 증명서를 선택하십시오.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CertificateButton('가족관계증명서'),
                    CertificateButton('폐쇄 가족관계증명서'),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CertificateButton('기본증명서'),
                    CertificateButton('폐쇄 기본증명서'),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CertificateButton('혼인관계증명서'),
                    CertificateButton('폐쇄 혼인관계증명서'),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CertificateButton('입양관계증명서'),
                    CertificateButton('폐쇄 입양관계증명서'),
                  ],
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomButton(Icons.home, '첫화면', context, '/'),
                BottomButton(Icons.arrow_back, '이전화면', context, '/other'),
              ],
            ),
            Text(
              '안녕하세요. 무인민원발급기입니다.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CertificateButton extends StatelessWidget {
  final String text;
  CertificateButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/other');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[800],
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          '500원',
          style: TextStyle(
            color: Colors.yellow[700],
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class BottomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final BuildContext context;
  final String route;

  BottomButton(this.icon, this.text, this.context, this.route);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, route);
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.yellow[700],
            child: Icon(
              icon,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Page'),
      ),
      body: Center(
        child: Text('This is the Other Page'),
      ),
    );
  }
}
