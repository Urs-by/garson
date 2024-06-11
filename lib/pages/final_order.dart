import 'package:flutter/material.dart';
import 'package:garson/temp_data.dart';
// import 'package:garson/buttons.dart';
import 'package:garson/text_titles.dart';
import 'package:garson/colors.dart';
import 'order_page.dart';

class FinalOrder extends StatelessWidget {
  const FinalOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          automaticallyImplyLeading: true,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          '5',
                          style: TextStyle(fontSize: 20),
                        ),
                        Image.asset('assets/images/table.png',
                            height: 20, width: 50),
                      ],
                    ),
                  ),
                  const Text(yourOrder),
                  const SizedBox(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          '22.40',
                          // amount.toStringAsFixed(2),
                          style: TextStyle(fontSize: 20),
                        ),

                        Text(
                          byn,
                        )
                        // Image.asset('assets/amount_icon.png', height: 30, width: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: const DishList(),
      bottomNavigationBar: Container(
        // color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrderPage()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.buttonBackgroundColor,),
              child: const Text(editOrder),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrderPage()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.buttonBackgroundColor,),
              child: const Text(order),
            ),
          ],
        ),
      ),
    );
  }
}

class DishList extends StatefulWidget {
  const DishList({super.key});

  @override
  _DishListState createState() => _DishListState();
}

class _DishListState extends State<DishList> {
  // Список блюд и их количество
  final List<Map<String, dynamic>> _dishes = disheslist;


  // Метод для увеличения количества
  void _incrementQuantity(int index) {
    setState(() {
      if (_dishes[index]['quantity'] < 99) {
        _dishes[index]['quantity']++;
      }
    });
  }

  // Метод для уменьшения количества
  void _decrementQuantity(int index) {
    setState(() {
      if (_dishes[index]['quantity'] > 0) {
        _dishes[index]['quantity']--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _dishes.length,
      itemBuilder: (context, index) {
        double totalPrice = _dishes[index]['quantity'] * _dishes[index]['price'];
        return ListTile(
          title: Text(_dishes[index]['name'],
            style: const TextStyle(fontSize: 22), ),
          subtitle: Text('Сумма: ${totalPrice.toStringAsFixed(2)}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () => _decrementQuantity(index),
              ),
              Text(
                _dishes[index]['quantity'].toString(),
                style: const TextStyle(fontSize: 18), // Уменьшаем размер шрифта
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => _incrementQuantity(index),
              ),
            ],
          ),
        );
      },
    );
  }

}
