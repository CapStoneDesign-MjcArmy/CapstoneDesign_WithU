import 'package:flutter/material.dart';
import 'secondpage.dart';

// void main() {
//   runApp(KioskCafeMain());
// }

class KioskCafeMain extends StatelessWidget {
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
      'name': 'Item 1',
      'price': 10.0,
      'category': 'Category 1',
      'image': 'https://via.placeholder.com/50'
    },
    {
      'name': 'Item 2',
      'price': 20.0,
      'category': 'Category 2',
      'image': 'https://via.placeholder.com/50'
    },
    {
      'name': 'Item 3',
      'price': 30.0,
      'category': 'Category 1',
      'image': 'https://via.placeholder.com/50'
    },
    {
      'name': 'Item 4',
      'price': 40.0,
      'category': 'Category 2',
      'image': 'https://via.placeholder.com/50'
    },
    {
      'name': 'Item 5',
      'price': 50.0,
      'category': 'Category 1',
      'image': 'https://via.placeholder.com/50'
    },
    {
      'name': 'Item 6',
      'price': 60.0,
      'category': 'Category 2',
      'image': 'https://via.placeholder.com/50'
    },
    {
      'name': 'Item 7',
      'price': 70.0,
      'category': 'Category 1',
      'image': 'https://via.placeholder.com/50'
    },
    {
      'name': 'Item 8',
      'price': 80.0,
      'category': 'Category 2',
      'image': 'https://via.placeholder.com/50'
    },
    {
      'name': 'Item 9',
      'price': 90.0,
      'category': 'Category 1',
      'image': 'https://via.placeholder.com/50'
    },
    {
      'name': 'Item 10',
      'price': 100.0,
      'category': 'Category 2',
      'image': 'https://via.placeholder.com/50'
    },
    // 필요한 만큼 더 추가
  ];

  String selectedCategory = 'All';

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
      MaterialPageRoute(builder: (context) => SecondPage()),
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
      MaterialPageRoute(builder: (context) => SecondPage()),
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
        title: Text('GridView Example'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => _changeCategory('All'),
                  child: Text('All'),
                  style: TextButton.styleFrom(
                    foregroundColor:
                        selectedCategory == 'All' ? Colors.black : Colors.white,
                    backgroundColor: selectedCategory == 'All'
                        ? Colors.white
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
                  onPressed: () => _changeCategory('Category 1'),
                  child: Text('Category 1'),
                  style: TextButton.styleFrom(
                    foregroundColor: selectedCategory == 'Category 1'
                        ? Colors.black
                        : Colors.white,
                    backgroundColor: selectedCategory == 'Category 1'
                        ? Colors.white
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
                  onPressed: () => _changeCategory('Category 2'),
                  child: Text('Category 2'),
                  style: TextButton.styleFrom(
                    foregroundColor: selectedCategory == 'Category 2'
                        ? Colors.black
                        : Colors.white,
                    backgroundColor: selectedCategory == 'Category 2'
                        ? Colors.white
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
          Expanded(
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
                    color: Colors.red,
                    margin: EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          items[actualIndex]['image'] ??
                              'https://via.placeholder.com/50',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          items[actualIndex]['name'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '\$${items[actualIndex]['price']}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 200, // Row의 높이를 늘림
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 8.0,
                children: selectedContainers.map((item) {
                  int itemIndex = selectedContainers.indexOf(item);
                  return Container(
                    color: Colors.blue,
                    width: 120, // 너비를 약간 늘림
                    height: 180, // 높이를 늘림
                    margin: EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          item['image'] ?? 'https://via.placeholder.com/50',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          item['name'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${(item['price'] * item['quantity']).toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove,
                                  color: Colors.white, size: 16),
                              onPressed: () => _decrementQuantity(itemIndex),
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                            ),
                            Text(
                              item['quantity'].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add,
                                  color: Colors.white, size: 16),
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
          Row(
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
                    '${_calculateTotalPrice()}',
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
        ],
      ),
    );
  }
}
