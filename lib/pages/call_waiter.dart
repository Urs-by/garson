import 'package:flutter/material.dart';


class CallWaiter extends StatelessWidget {
  const CallWaiter({super.key});

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
