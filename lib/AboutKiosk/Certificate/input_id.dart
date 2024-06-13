import 'package:flutter/material.dart';

class Idinput extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Idinput> {
  TextEditingController _controller = TextEditingController();

  void _onKeypadButtonPressed(String value) {
    setState(() {
      _controller.text = _controller.text + value;
    });
  }

  void _onCorrectionButtonPressed() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _controller.text = _controller.text.substring(0, _controller.text.length - 1);
      }
    });
  }

  void _onDeleteButtonPressed() {
    setState(() {
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주민등록번호 확인'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: Text(
                '큰 글씨 보기\n(화면 확대)',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                textStyle: TextStyle(fontSize: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16), // 모서리를 둥글게 설정
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16), // 모서리를 둥글게 설정
              ),
              child: Text(
                '주민등록번호를 입력하시고 확인을 누르십시오.',
                style: TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(11.0),
                      color: Colors.grey[400],
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              labelText: '주민번호 입력창',
                              labelStyle: TextStyle(color: Colors.white),
                              filled: true,
                              fillColor: Colors.black54,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Icon(Icons.person, color: Colors.white),
                            ),
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 20), // 세로 크기를 줄이기 위해 높이 조정
                          Text(
                            '본인 확인이 필요한 증명서입니다.\n주민등록증을 발급 받은 시점에 한하여 이용 가능합니다.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // 거리를 더 가깝게 설정
                  Expanded(
                    flex: 1, // 키패드를 왼쪽으로 이동시키기 위해 flex 값을 늘렸습니다.
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ...List.generate(3, (rowIndex) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(3, (colIndex) {
                              int number = rowIndex * 3 + colIndex + 1;
                              return Padding(
                                padding: const EdgeInsets.all(4.0), // 버튼 간격 조정
                                child: ElevatedButton(
                                  onPressed: () => _onKeypadButtonPressed(number.toString()),
                                  child: Text('$number',
                                    style: TextStyle(fontSize: 9),),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    minimumSize: Size(10, 80),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0), // 버튼 간격 조정
                              child: ElevatedButton(
                                onPressed: () => _onKeypadButtonPressed('0'),
                                child: Text('0',
                                  style: TextStyle(
                                      fontSize: 7
                                  ),),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                  minimumSize: Size(7, 90),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0), // 버튼 간격 조정
                              child: ElevatedButton(
                                onPressed: _onCorrectionButtonPressed,
                                child: Text(
                                  '정\n정',
                                  style: TextStyle(fontSize: 11),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellow,
                                  minimumSize: Size(10, 90),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0), // 버튼 간격 조정
                              child: ElevatedButton(
                                onPressed: _onDeleteButtonPressed,
                                child: Text(
                                  '삭\n제',
                                  style: TextStyle(fontSize: 11),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  minimumSize: Size(10, 90),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 설정
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('첫화면'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('이전화면'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('확 인'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}