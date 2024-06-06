import 'package:flutter/material.dart';
import 'text_titles.dart';
import 'theme.dart';
import 'buttons.dart';
import 'pages.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: siteTitle,
      theme: AppTheme.lightTheme,
      //darkTheme: AppTheme.darkTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(cafe_name),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                width: 300,
                child: Text(
                  buonVenuto,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  // style: Theme.of(context).textTheme.bodyLarge, // Применяем стиль из темы
                ),
              ),
              const SizedBox(
                height: 25,
                child: Text(
                  yourTable,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              // Добавляем отступ между текстом и изображением
              Image.asset(
                'assets/images/waiter.png', // Путь к вашему изображению
                width: 350,
                height: 450,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  StartButton(
                      buttonText: callWaiter,
                      page: FirstPage(),
                      underButtonText: nullText),
                  SizedBox(width: 30),
                  StartButton(
                      buttonText: orderYourself,
                      page: SecondPage(),
                      underButtonText: discount),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
