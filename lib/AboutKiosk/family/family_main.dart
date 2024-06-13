import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '문서 선택',
      home: MainPage(),
      routes: {
        '/documentSelection': (context) => DocumentSelectionScreen(),
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
            Navigator.pushNamed(context, '/documentSelection');
          },
          child: Text('문서 선택 페이지로 이동'),
        ),
      ),
    );
  }
}

class DocumentSelectionScreen extends StatelessWidget {
  final List<Map<String, String>> documents = [
    {'title': '가족관계증명서', 'price': '500원'},
    {'title': '폐쇄 가족관계증명서', 'price': '500원'},
    {'title': '기본증명서', 'price': '500원'},
    {'title': '폐쇄 기본증명서', 'price': '500원'},
    {'title': '혼인관계증명서', 'price': '500원'},
    {'title': '폐쇄 혼인관계증명서', 'price': '500원'},
    {'title': '입양관계증명서', 'price': '500원'},
    {'title': '폐쇄 입양관계증명서', 'price': '500원'},
  ];

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
              child: GridView.builder(
                padding: EdgeInsets.all(20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black54,
                      padding: EdgeInsets.all(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            documents[index]['title']!,
                            style: TextStyle(fontSize: 14, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          documents[index]['price']!,
                          style: TextStyle(fontSize: 12, color: Colors.yellow),
                        ),
                      ],
                    ),
                  );
                },
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
}
