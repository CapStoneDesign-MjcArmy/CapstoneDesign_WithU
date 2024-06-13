import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '문서 선택',
      home: DocumentSelectionScreen(),
    );
  }
}

class DocumentSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '일반증명서, 상세증명서, 특정증명서 중 선택해주십시오.',
                style: TextStyle(fontSize: 14, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(20),
                children: [
                  buildDocumentButton(
                    '부모, 배우자, 생존한 현재의 혼인 중의 자녀에 관한 사항이 기재되는 증명서',
                    '일반증명서',
                  ),
                  buildDocumentButton(
                    '부모, 배우자, 모든 자녀에 관한 사항이 기재되는 증명서',
                    '상세증명서',
                  ),
                  buildDocumentButton(
                    '선택한 부모, 모, 배우자 및 자녀에 관한 사항이 기재되는 증명서',
                    '특정증명서',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '※ 용도에 알맞은 증명서를 선택하여 발급하여 주시기 바랍니다.',
                style: TextStyle(fontSize: 14, color: Colors.orange),
                textAlign: TextAlign.center,
              ),
            ),
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '<가족관계등록부 → 가족관계증명서>',
                style: TextStyle(fontSize: 14, color: Colors.white),
                textAlign: TextAlign.center,
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

  Widget buildDocumentButton(String description, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black54,
          padding: EdgeInsets.all(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 16, color: Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }
}
