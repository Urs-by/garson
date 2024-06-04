import 'package:flutter/material.dart';
import 'text_titles.dart';
import 'theme.dart';


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
      title: site_title,
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
        appBar: AppBar(

        title: Text(cafe_name),
        ),

    // body: Text(),
    //
    );
  }
}


