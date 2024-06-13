import 'package:flutter/material.dart';
import '../print_info.dart';
import 'print_num_select_pub.dart';

class Idcheck extends StatelessWidget {
  final String idNumber;

  Idcheck({required this.idNumber}); // 생성자 추가

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
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CertificateIssuanceForm(idNumber: idNumber, include: true)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    shadowColor: Colors.black26,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '포함',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '\n\n\n\n\n\n포함시 출력\n\n\n예) 881111 - 1112223\n\n\n\n\n',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CertificateIssuanceForm(idNumber: idNumber, include: false)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    shadowColor: Colors.black26,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '미포함',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '\n\n\n\n\n\n미포함시 출력\n\n\n예) 881111 - ******\n\n\n\n\n',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  icon: Icon(Icons.home, size: 40, color: Colors.yellow),
                  label: Text('첫화면', style: TextStyle(fontSize: 16, color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, size: 40, color: Colors.yellow),
                  label: Text('이전화면', style: TextStyle(fontSize: 16, color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
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

class CertificateIssuanceForm extends StatefulWidget {
  final String idNumber;
  final bool include;

  CertificateIssuanceForm({required this.idNumber, required this.include}); // 생성자 추가

  @override
  _CertificateIssuanceFormState createState() => _CertificateIssuanceFormState();
}

class _CertificateIssuanceFormState extends State<CertificateIssuanceForm> {
  int selectedCount = 0;

  void _onNumberPressed(int number) {
    setState(() {
      selectedCount = number;
    });
  }

  void _onConfirmPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmPage(selectedCount: selectedCount, papername: '가족관계증명서', fee: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  '발급할 부수를 입력한 후 확인을 누르십시오.',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.grey.withOpacity(0.5), // 반투명 회색 배경
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '신청증명서',
                            style: TextStyle(color: Colors.blue),
                          ),
                          Text(
                            '가족관계증명서',
                            style: TextStyle(color: Colors.blue),
                          ),
                          Text(
                            '증명 구분',
                            style: TextStyle(color: Colors.blue),
                          ),
                          Text('일반증명서', style: TextStyle(color: Colors.white)),
                          Text(
                            '주민등록번호 뒷자리 표시(${widget.include ? "공개" : "비공개"})', // 포함 여부 표시
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.blue[100],
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        '발급부수\n $selectedCount 부',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text('최대 9부까지 선택 가능합니다.', style: TextStyle(color: Colors.white)),
                SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return ElevatedButton(
                        onPressed: () => _onNumberPressed(index + 1),
                        child: Text('${index + 1}'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black,
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton.icon(
                      onPressed: () {
                        // 첫화면 버튼 눌렀을 때 처리
                      },
                      icon: Icon(Icons.home),
                      label: Text('첫화면'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // 이전화면 버튼 눌렀을 때 처리
                      },
                      icon: Icon(Icons.arrow_back),
                      label: Text('이전화면'),
                    ),
                    ElevatedButton(
                      onPressed: _onConfirmPressed,
                      child: Text('확인'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
