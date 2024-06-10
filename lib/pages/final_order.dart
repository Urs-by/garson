import 'package:flutter/material.dart';


class FinalOrder extends StatelessWidget {
  const FinalOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ваш заказ'),
      ),
      body: const Center(
        child: Text('This is the Second Page'),
      ),
    );
  }
}