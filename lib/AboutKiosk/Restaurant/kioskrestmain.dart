import 'package:flutter/material.dart';
import 'secondpagerest.dart';
import 'selectorderfood.dart';

// void main() {
//   runApp(KioskCafeMain());
// }

class KioskRestMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> selectedContainers = [];
  final List<Map<String, dynamic>> items = [
    {
      'name': '사이다',
      'price': 2000,
      'category': 'drink',
      'image': 'assets/images/drink/cider.png'
    },
    {
      'name': '콜라',
      'price': 2000,
      'category': 'drink',
      'image': 'assets/images/drink/coke.png'
    },
    {
      'name': '레모네이드',
      'price': 3000,
      'category': 'drink',
      'image': 'assets/images/drink/lemonade.png'
    },
    {
      'name': '치즈돈카츠',
      'price': 8000,
      'category': 'fried',
      'image': 'assets/images/fried/cheezefried.png'
    },
    {
      'name': '돈카츠',
      'price': 7500,
      'category': 'fried',
      'image': 'assets/images/fried/forkfried.png'
    },
    {
      'name': '새우튀김',
      'price': 5000,
      'category': 'fried',
      'image': 'assets/images/fried/shirimp.png'
    },
    {
      'name': '비빔면',
      'price': 4000,
      'category': 'noodle',
      'image': 'assets/images/noodle/bibim.png'
    },
    {
      'name': '멸치국수',
      'price': 3500,
      'category': 'noodle',
      'image': 'assets/images/noodle/envy.png'
    },
    {
      'name': '볶음면',
      'price': 5000,
      'category': 'noodle',
      'image': 'assets/images/noodle/friednoodle.png'
    },
    {
      'name': '라면',
      'price': 3000,
      'category': 'noodle',
      'image': 'assets/images/noodle/ramen.png'
    },
    {
      'name': '삶은 계란',
      'price': 2000,
      'category': 'sidemenu',
      'image': 'assets/images/sidemenu/boilegg.png'
    },
    {
      'name': '공기밥',
      'price': 1500,
      'category': 'sidemenu',
      'image': 'assets/images/sidemenu/rice.png'
    },
    // 필요한 만큼 더 추가
  ];

  String selectedCategory = 'noodle';

  double _calculateTotalPrice() {
    double total = 0.0;
    for (var item in selectedContainers) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  int _calculateTotalQuantity() {
    int totalQuantity = 0;
    for (var item in selectedContainers) {
      totalQuantity += item['quantity'] as int;
    }
    return totalQuantity;
  }

  void _showQuantityDialog(int index) {
    int quantity = 1;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text(items[index]['name'] + ' 주문 수량'),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) quantity--;
                      });
                    },
                  ),
                  Text(quantity.toString(), style: TextStyle(fontSize: 20)),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    _addContainer(index, quantity);
                    Navigator.of(context).pop();
                  },
                  child: Text('Confirm'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _addContainer(int index, int quantity) {
    int existingIndex =
        selectedContainers.indexWhere((item) => item['index'] == index);
    if (existingIndex != -1) {
      setState(() {
        selectedContainers[existingIndex]['quantity'] += quantity;
      });
    } else {
      setState(() {
        selectedContainers.add({
          'index': index,
          'name': items[index]['name'],
          'quantity': quantity,
          'price': items[index]['price'],
          'image': items[index]['image']
        });
      });
    }
  }

  void _incrementQuantity(int index) {
    setState(() {
      selectedContainers[index]['quantity'] += 1;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (selectedContainers[index]['quantity'] > 1) {
        selectedContainers[index]['quantity'] -= 1;
      } else {
        selectedContainers.removeAt(index);
      }
    });
  }

  void _navigateAndReset() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RestSecondPage()),
    ).then((_) {
      // Reset selectedContainers after returning from the second page
      setState(() {
        selectedContainers = [];
      });
    });
  }

  void _reset() {
    setState(() {
      selectedContainers = [];
    });
  }

  void _navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RestSecondPage()),
    );
  }

  void _changeCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<int> filteredIndices = [];
    for (int i = 0; i < items.length; i++) {
      if (selectedCategory == 'All' ||
          items[i]['category'] == selectedCategory) {
        filteredIndices.add(i);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('메뉴 선택'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RestSelectOrder()),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 255, 244, 194),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => _changeCategory('noodle'),
                    child: Text('면류'),
                    style: TextButton.styleFrom(
                      foregroundColor: selectedCategory == 'noodle'
                          ? Colors.black
                          : Colors.white,
                      backgroundColor: selectedCategory == 'noodle'
                          ? Color.fromARGB(255, 255, 244, 194)
                          : Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () => _changeCategory('fried'),
                    child: Text('튀김류'),
                    style: TextButton.styleFrom(
                      foregroundColor: selectedCategory == 'fried'
                          ? Colors.black
                          : Colors.white,
                      backgroundColor: selectedCategory == 'fried'
                          ? Color.fromARGB(255, 255, 244, 194)
                          : Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () => _changeCategory('sidemenu'),
                    child: Text('사이드'),
                    style: TextButton.styleFrom(
                      foregroundColor: selectedCategory == 'sidemenu'
                          ? Colors.black
                          : Colors.white,
                      backgroundColor: selectedCategory == 'sidemenu'
                          ? Color.fromARGB(255, 255, 244, 194)
                          : Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () => _changeCategory('drink'),
                    child: Text('음료'),
                    style: TextButton.styleFrom(
                      foregroundColor: selectedCategory == 'drink'
                          ? Colors.black
                          : Colors.white,
                      backgroundColor: selectedCategory == 'drink'
                          ? Color.fromARGB(255, 255, 244, 194)
                          : Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Color.fromARGB(255, 255, 244, 194),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: filteredIndices.length,
                itemBuilder: (context, index) {
                  int actualIndex = filteredIndices[index];
                  return GestureDetector(
                    onTap: () {
                      _showQuantityDialog(actualIndex);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 255, 218, 116),
                            width: 2),
                      ),
                      margin: EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            items[actualIndex]['image'],
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(height: 1.0),
                          Text(
                            items[actualIndex]['name'],
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 1.0),
                          Text(
                            '${items[actualIndex]['price']}원',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            color: Color.fromARGB(255, 255, 218, 169),
            height: 200, // Row의 높이를 늘림
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 8.0,
                children: selectedContainers.map((item) {
                  int itemIndex = selectedContainers.indexOf(item);
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 146, 255, 125), width: 2),
                    ),
                    width: 120, // 너비를 약간 늘림
                    height: 180, // 높이를 늘림
                    margin: EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          item['image'],
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          item['name'],
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${(item['price'] * item['quantity'])}원',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  size: 16),
                              onPressed: () => _decrementQuantity(itemIndex),
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                            ),
                            Text(
                              item['quantity'].toString(),
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  size: 16),
                              onPressed: () => _incrementQuantity(itemIndex),
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
            color: Color.fromARGB(255, 255, 218, 169),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('총 가격 ',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      '${_calculateTotalPrice()}원',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('주문 수량',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      '${_calculateTotalQuantity()}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape:
                        //버튼 모양을 네모로 변경
                        MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    )),
                    //좌우 너비를 줄임
                    minimumSize: MaterialStateProperty.all(Size(30, 50)),
                  ),
                  onPressed: _reset,
                  child: Text(
                    '주문 취소',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape:
                        //버튼 모양을 네모로 변경
                        MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    )),
                    //좌우 너비를 줄임
                    minimumSize: MaterialStateProperty.all(Size(30, 50)),
                  ),
                  onPressed: _navigateAndReset,
                  child: Text(
                    '카드 결제',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape:
                        //버튼 모양을 네모로 변경
                        MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    )),
                    //좌우 너비를 줄임
                    minimumSize: MaterialStateProperty.all(Size(30, 50)),
                  ),
                  onPressed: _navigateAndReset,
                  child: Text(
                    '기타 결제',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
