import 'package:flutter/material.dart';
import 'package:garson/pages/final_order.dart';
import 'package:garson/text_titles.dart';
import "package:garson/colors.dart";
import 'package:garson/temp_data.dart';
import 'package:garson/product_items.dart';


class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int countDishes = 0; // Пример данных, которые могут изменяться
  double amount = 0.00; // Пример данных, которые могут изменяться

  // Метод для получения данных из внешней базы (пример)
  Future<void> fetchData() async {
    // Имитируем получение данных из внешней базы данных
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      countDishes = 5; // Например, полученное значение
      amount = 123.45; // Например, полученное значение
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Получаем данные при инициализации
  }

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
                  SizedBox(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FinalOrder()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            countDishes.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          Image.asset('assets/images/table.png',
                              height: 20, width: 50),
                        ],
                      ),
                    ),
                  ),
                  Image.asset('assets/images/logo.png', height: 50, width: 50),
                  // Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // children: <Widget>[
                  //     Image.asset('assets/images/logo.png', height: 50, width: 50),
                  //    ],
                  // ),
                  SizedBox(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FinalOrder()),
                        );
                      },
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            amount.toStringAsFixed(2),
                            style: const TextStyle(fontSize: 20),
                          ),

                          const Text(
                            byn,
                          )
                          // Image.asset('assets/amount_icon.png', height: 30, width: 30),
                        ],
                      ),
                    ),
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
  late final List<String> categories;

  // late final Map<String, List<String>> dishes;

  @override
  void initState() {
    super.initState();
    categories =
        categoriesList; // Присваиваем значение из импортированного файла
    // dishes = dishesMap; // Присваиваем значение из импортированного файла
  }

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
    return Column(
      children: [
        SizedBox(
          height: 80, // высота контейнера для категорий
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
        const Expanded(
          child: ProductListScreen(),
          // child: ListView.builder(
          //   itemCount: dishes[categories[_currentCategoryIndex]]?.length ?? 0,
          //   itemBuilder: (context, index) {
          //     return Card(
          //       child: ListTile(
          //         title: Text(dishes[categories[_currentCategoryIndex]]![index]),
          //       ),
          //     );
          //   },
          // ),
        ),
      ],
    );
  }
}
