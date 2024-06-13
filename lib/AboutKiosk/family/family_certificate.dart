import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '발급 안내',
      home: DocumentGuideScreen(),
    );
  }
}

class DocumentGuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundImg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '가족관계증명서 발급을 계속하시려면 확인버튼을\n발급업무를 중단하시려면 첫화면버튼을 눌러주십시오.',
                style: TextStyle(fontSize: 14, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    '[발급안내]',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '| 가족관계증명서는 신청인(본인)을 기준으로\n  부모, 배우자, 자녀 3대에 한해서만\n  인적사항이 출력됩니다.',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '| 형제, 자매의 인적사항이 필요한 경우에는\n  가까운 관공서에 방문하여 확인하시기 바랍니다.',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.home),
                    label: Text('첫화면'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back),
                    label: Text('이전화면'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.check),
                    label: Text('확인'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '안녕하세요. 무인민원발급기입니다.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
