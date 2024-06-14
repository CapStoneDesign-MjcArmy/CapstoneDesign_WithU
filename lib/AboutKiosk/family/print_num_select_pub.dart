import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'print_info.dart';
import '../Certificate/certificate_main.dart';
import '../Certificate/id_select_type.dart'; //ConfirmPage('')

class CertificateIssuancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CertificateIssuanceForm(),
    );
  }
}

class CertificateIssuanceForm extends StatefulWidget {
  @override
  _CertificateIssuanceFormState createState() =>
      _CertificateIssuanceFormState();
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
        builder: (context) => ConfirmPage(
            selectedCount: selectedCount, papername: '가족관계증명서', fee: 500),
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
                      color: Colors.grey.withOpacity(0.8), // 반투명 회색 배경
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '신청증명서',
                            style: TextStyle(color: Colors.black87),
                          ),
                          Text(
                            '가족관계증명서',
                            style: TextStyle(color: Colors.black87),
                          ),
                          Text(
                            '증명 구분',
                            style: TextStyle(color: Colors.black87),
                          ),
                          Text('일반증명서', style: TextStyle(color: Colors.white)),
                          Text(
                            '주민등록번호 뒷자리 표시(공개)',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.blue[100],
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        '발급부수\n $selectedCount 부',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text('최대 9부까지 선택 가능합니다.',
                    style: TextStyle(color: Colors.white)),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CertificateMain()),
                        );
                      },
                      icon: Icon(Icons.home),
                      label: Text('첫화면'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CertificateSelectionPage()),
                        );
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
