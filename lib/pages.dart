import 'package:flutter/material.dart';
import 'text_titles.dart';
import "colors.dart";

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: const Center(
        child: Text('This is the Second Page'),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  static const List<String> categories = [
    'Пицца',
    'Паста',
    'Супы',
    'Горячие блюда',
    'Салаты',
    'Закуски',
    'Гарниры',
    'Напитки',
    'Десерты',
    'Хлеб',
    'Детское Меню'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0), // высота AppBar
        child: AppBar(
          automaticallyImplyLeading: true,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        '0',
                        style: TextStyle(fontSize: 20),
                      ),
                      Image.asset('assets/images/table.png',
                          height: 20, width: 50),
                    ],
                  ),
                  Image.asset('assets/images/logo.png', height: 50, width: 50),
                  // Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // children: <Widget>[
                  //     Image.asset('assets/images/logo.png', height: 50, width: 50),
                  //    ],
                  // ),
                  const Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        '0.00',
                        style: TextStyle(fontSize: 20),
                      ),

                      Text(
                        byn,
                      )
                      // Image.asset('assets/amount_icon.png', height: 30, width: 30),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
       body: const Order(),
    );
  }
}

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  final List<String> categories = [
    'Пицца', 'Паста', 'Супы', 'Горячее', 'Салаты',
    'Закуски', 'Гарниры', 'Напитки', 'Десерты', 'Хлеб', 'Детское'
  ];

  final Map<String, List<String>> dishes = {
    'Пицца': ['Пепперони', 'Маргарита', 'Гавайская'],
    'Паста': ['Карбонара', 'Болоньезе', 'Альфредо'],
    'Супы': ['Борщ', 'Солянка', 'Куриный суп'],
    // добавьте остальные категории и блюда
  };

  int _currentCategoryIndex = 0;

  void _previousCategory() {
    setState(() {
      _currentCategoryIndex =
          (_currentCategoryIndex - 1 + categories.length) % categories.length;
    });
  }

  void _nextCategory() {
    setState(() {
      _currentCategoryIndex = (_currentCategoryIndex + 1) % categories.length;
    });
  }

  String _getPreviousCategory() {
    int previousIndex =
        (_currentCategoryIndex - 1 + categories.length) % categories.length;
    return categories[previousIndex];
  }

  String _getNextCategory() {
    int nextIndex = (_currentCategoryIndex + 1) % categories.length;
    return categories[nextIndex];
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          SizedBox(
            height: 150, // высота контейнера для категорий
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: _previousCategory,
                    child: Center(
                      child: Text(
                        _getPreviousCategory(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          color: AppColors.accentColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      categories[_currentCategoryIndex],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accentColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: _nextCategory,
                    child: Center(
                      child: Text(
                        _getNextCategory(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          color: AppColors.accentColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dishes[categories[_currentCategoryIndex]]?.length ?? 0,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(dishes[categories[_currentCategoryIndex]]![index]),
                  ),
                );
              },
            ),
          ),
        ],

    );
  }
}