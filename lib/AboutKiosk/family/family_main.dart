import 'package:flutter/material.dart';
import '../kiosk_info.dart';
import 'family_certificate.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '문서 선택',
      home: MainPage(),
      routes: {
        'documentSelection': (context) => DocumentSelectionScreen(),
        'familyCertificate': (context) => KioskInfo(),
        '/closedFamilyCertificate': (context) =>
            TemporaryScreen(title: '폐쇄 가족관계증명서'),
        '/basicCertificate': (context) => TemporaryScreen(title: '기본증명서'),
        '/closedBasicCertificate': (context) =>
            TemporaryScreen(title: '폐쇄 기본증명서'),
        '/marriageCertificate': (context) => TemporaryScreen(title: '혼인관계증명서'),
        '/closedMarriageCertificate': (context) =>
            TemporaryScreen(title: '폐쇄 혼인관계증명서'),
        '/adoptionCertificate': (context) => TemporaryScreen(title: '입양관계증명서'),
        '/closedAdoptionCertificate': (context) =>
            TemporaryScreen(title: '폐쇄 입양관계증명서'),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메인 페이지'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DocumentSelectionScreen()),
            );
          },
          child: Text('문서 선택 페이지로 이동'),
        ),
      ),
    );
  }
}

class DocumentSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('문서 선택'),
      ),
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
            Text(
              '발급을 원하시는 증명서를 선택하십시오.',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(20),
                crossAxisCount: 2,
                childAspectRatio: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildDocumentButton(
                      context, '가족관계증명서', '500원', DocumentGuideScreen()),
                  _buildDocumentButton(context, '폐쇄 가족관계증명서', '500원',
                      TemporaryScreen(title: '폐쇄 가족관계증명서')),
                  _buildDocumentButton(context, '기본증명서', '500원',
                      TemporaryScreen(title: '기본증명서')),
                  _buildDocumentButton(context, '폐쇄 기본증명서', '500원',
                      TemporaryScreen(title: '폐쇄 기본증명서')),
                  _buildDocumentButton(context, '혼인관계증명서', '500원',
                      TemporaryScreen(title: '혼인관계증명서')),
                  _buildDocumentButton(context, '폐쇄 혼인관계증명서', '500원',
                      TemporaryScreen(title: '폐쇄 혼인관계증명서')),
                  _buildDocumentButton(context, '입양관계증명서', '500원',
                      TemporaryScreen(title: '입양관계증명서')),
                  _buildDocumentButton(context, '폐쇄 입양관계증명서', '500원',
                      TemporaryScreen(title: '폐쇄 입양관계증명서')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.home),
                    label: Text('첫화면'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
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

  Widget _buildDocumentButton(
      BuildContext context, String title, String price, Widget routePage) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => routePage),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black54,
        padding: EdgeInsets.all(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 5),
          Text(
            price,
            style: TextStyle(fontSize: 12, color: Colors.yellow),
          ),
        ],
      ),
    );
  }
}

class TemporaryScreen extends StatelessWidget {
  final String title;

  TemporaryScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('$title 페이지 (구현 예정)'),
      ),
    );
  }
}
