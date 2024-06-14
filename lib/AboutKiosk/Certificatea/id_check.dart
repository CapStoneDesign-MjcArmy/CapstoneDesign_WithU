import 'package:flutter/material.dart';

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주민등록번호 선택'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgroundImg.png"), // 배경 이미지를 추가하세요
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '주민등록번호 뒷자리 포함 여부를 선택하여 주십시오.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionCard(
                  title: '포함',
                  description: '포함시 출력\n예) 881111 - 1112223',
                  onTap: () {
                    // '포함' 선택 시의 동작을 여기에 작성하세요
                  },
                ),
                OptionCard(
                  title: '미포함',
                  description: '미포함시 출력\n예) 881111 - ******',
                  onTap: () {
                    // '미포함' 선택 시의 동작을 여기에 작성하세요
                  },
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NavigationButton(
                  icon: Icons.home,
                  label: '첫화면',
                  onTap: () {
                    // 첫화면으로 이동하는 동작을 여기에 작성하세요
                  },
                ),
                SizedBox(width: 20),
                NavigationButton(
                  icon: Icons.arrow_back,
                  label: '이전화면',
                  onTap: () {
                    // 이전 화면으로 이동하는 동작을 여기에 작성하세요
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Text('<가족관계등록부 -> 가족관계증명서>',
                style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  OptionCard({required this.title, required this.description, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.blue),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  NavigationButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.yellow),
          Text(label, style: TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    );
  }
}