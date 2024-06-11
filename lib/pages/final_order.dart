import 'package:flutter/material.dart';
import 'package:garson/buttons.dart';
import 'package:garson/text_titles.dart';
// import 'package:garson/temp_data.dart';
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
                        Text(
                          '5',
                          style: const TextStyle(fontSize: 20),
                        ),
                        Image.asset('assets/images/table.png',
                            height: 20, width: 50),
                      ],
                    ),
                  ),

                  Text('Ваш заказ:'),
                  // Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // children: <Widget>[
                  //     Image.asset('assets/images/logo.png', height: 50, width: 50),
                  //    ],
                  // ),
                  SizedBox(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          '22.40',
                          // amount.toStringAsFixed(2),
                          style: const TextStyle(fontSize: 20),
                        ),

                        const Text(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 350,
            ),
            // Ваш контент, который будет скроллироваться
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  StartButton(
                      buttonText: editOrder,
                      page: OrderPage(),
                      underButtonText: nullText),
                  SizedBox(width: 15),
                  StartButton(
                      buttonText: order,
                      page: OrderPage(),
                      underButtonText: nullText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
