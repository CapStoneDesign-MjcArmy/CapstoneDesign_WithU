import 'package:flutter/material.dart';

class CcimMain extends StatelessWidget {
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
            'assets/backgroundImg.png', // 배경 이미지 경로
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
                    _buildButton(context, '주민등록', '동일: 무료 / 초본: 200원'),
                    _buildButton(context, '지적, 토지, 건축', '수수료: 다양함'),
                    _buildButton(context, '주민등록', '차량등록: 300원 인감: 1500원'),
                    _buildButton(context, '보건건축', '무료'),
                    _buildButton(context, '농지원부\n농업경영체', '수수료: 다양함'),
                    _buildButton(context, '가족관계등록부', '500원'),
                    _buildButton(context, '제적부', '활동: 500원 동본: 300원'),
                    _buildButton(context, '병적증명서', '무료'),
                    _buildButton(context, '지방세 세목별\n과세증명서', '전체과세: 800원'),
                    _buildButton(context, '어선원부', '전월기: 1장당 700원'),
                    _buildButton(context, '교육제증명\n대학교(원) 제외', '무료'),
                    _buildButton(context, '국세증명', '무료'),
                    _buildButton(context, '건강보험', '무료'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton('설치장소 안내'),
                  _buildActionButton('서비스 시간'),
                  _buildActionButton('화면 확대\n(저시력 고객용)'),
                  _buildActionButton('발급 수수료'),
                  _buildActionButton('동전 반환'),
                ],
              ),
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

  Widget _buildButton(BuildContext context, String title, String subtitle) {
    return ElevatedButton(
      onPressed: () {},
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
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black54,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(8.0),
        minimumSize: Size(100, 80),
      ),
    );
  }

  Widget _buildActionButton(String title) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(8.0),
        minimumSize: Size(80, 40),
      ),
    );
  }
}
