import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:withu/AboutKiosk/Certificate/paid_with_money.dart';

class ConfirmPage extends StatelessWidget {
  final int selectedCount, fee;
  final String papername;

  ConfirmPage(
      {required this.papername,
      required this.selectedCount,
      required this.fee});

  @override
  Widget build(BuildContext context) {
    int feePerCopy = fee;
    int totalFee = selectedCount * feePerCopy;

    return Scaffold(
      appBar: AppBar(
        title: Text('확인 페이지'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgroundImg.png', // 배경 이미지 파일 경로
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text(
                  '민원 신청 내용을 확인해 주세요.',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.grey.withOpacity(0.7), // 배경 회색
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('신청증명서',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                          Text(papername,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                      Divider(color: Colors.white),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('신청부수',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                          Text('$selectedCount 부',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                      Divider(color: Colors.white),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1부당 수수료',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                          Text('500 원',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                      Divider(color: Colors.white),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('합계',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.orange)),
                          Text('$totalFee 원',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.orange)),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondPage()),
                        );
                      },
                      icon: Icon(Icons.credit_card,
                          size: 30, color: Colors.white),
                      label: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('카드',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                          Text('(신용/체크카드 등)',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white)),
                          Text('삼성페이 가능',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white)),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // 현금 버튼 눌렀을 때 처리
                      },
                      icon: Icon(Icons.money, size: 30, color: Colors.white),
                      label: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('현금',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                          Text(
                            ' ',
                            style: TextStyle(fontSize: 8),
                          ),
                          Text('(동전, 천원권 지폐)',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white)),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // 첫화면 버튼 눌렀을 때 처리
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
                SizedBox(height: 10),
                Text('<가족관계등록부 → 가족관계증명서>',
                    style: TextStyle(fontSize: 12, color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
