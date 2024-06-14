import 'package:flutter/material.dart';
import 'package:withu/AboutKiosk/Certificatea/select_id_type.dart';
import '../family/family_main.dart';

class CertificateMain extends StatelessWidget {
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/backgroundImg.png', // 배경 이미지 경로
            fit: BoxFit.cover, // 화면 전체를 덮도록 설정
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  color: Color(0x00DBF9AB), // 배경 색상 설정
                  padding: const EdgeInsets.all(8.0), // 텍스트 주위에 패딩 추가
                  child: Text(
                    '발급을 원하시는 증명서를 선택하십시오.\n개인정보 보호법에 의거하여 현재 카메라가 작동 중입니다.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  padding: const EdgeInsets.all(10.0),
                  children: [
                    _buildButton(context, '주민등록', '\n' '초본: 200원',
                        CertificateSelectionPage()),
                    _buildButton(
                        context, '지적, 토지, 건축', '\n' '수수료: 다양함', OtherPage()),
                    _buildButton(context, '주민등록', '\n' '차량등록: 300원\n인감: 1500원',
                        OtherPage()),
                    _buildButton(context, '보건건축', '\n' '무료', OtherPage()),
                    _buildButton(
                        context, '농지원부\n농업경영체', '\n' '수수료: 다양함', OtherPage()),
                    _buildButton(context, '가족관계등록부', '\n' '500원',
                        DocumentSelectionScreen()),
                    _buildButton(
                        context, '제적부', '\n' '활동: 500원 동본: 300원', OtherPage()),
                    _buildButton(context, '병적증명서', '\n' '무료', OtherPage()),
                    _buildButton(context, '지방세 세목별\n과세증명서', '\n' '전체과세: 800원',
                        OtherPage()),
                    _buildButton(
                        context, '어선원부', '\n' '전월기: 1장당 700원', OtherPage()),
                    _buildButton(
                        context, '교육제증명\n대학교(원) 제외', '\n' '무료', OtherPage()),
                    _buildButton(context, '국세증명', '\n' '무료', OtherPage()),
                    _buildButton(context, '건강보험', '\n' '무료', OtherPage()),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildButtonSection([
                '설치장소\n안내',
                '서비스\n시간',
                '화면 확대',
                '발급\n수수료',
                '동전\n반환',
              ]),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  '안녕하세요. 무인민원발급기입니다.',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, String title, String subtitle, Widget page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(8.0),
        minimumSize: Size(100, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );
  }

  Widget _buildButtonSection(List<String> titles) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: titles.map((title) => _buildActionButton(title)).toList(),
    );
  }

  Widget _buildActionButton(String title) {
    Color backgroundColor;
    if (title.contains('설치장소\n안내') || title.contains('서비스\n시간')) {
      backgroundColor = Colors.green;
    } else if (title.contains('화면 확대')) {
      backgroundColor = Colors.orange;
    } else {
      backgroundColor = Colors.red;
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(15),
          shape: CircleBorder(), // 원형으로 변경
          backgroundColor: backgroundColor,
        ),
        child: Container(
          width: 40, // 버튼 크기 조정
          height: 40,
          alignment: Alignment.center,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 10), // 글씨 크기 조정
          ),
        ),
      ),
    );
  }
}

class ResidentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주민등록'),
      ),
      body: Center(
        child: Text('주민등록 페이지입니다.'),
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기타 페이지'),
      ),
      body: Center(
        child: Text('기타 페이지입니다.'),
      ),
    );
  }
}
