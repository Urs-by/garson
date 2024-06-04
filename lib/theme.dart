import 'package:flutter/material.dart';
import 'colors.dart'; // Импортируйте ваш файл с цветами

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryColor, //primary -
        // Основной цвет приложения. Используется для элементов интерфейса

        secondary: AppColors.secondaryColor, //secondary -
        // Вторичный цвет приложения, который используется для акцентных
        // элементов, таких как кнопки, иконки и другие элементы интерфейса,
        // которые требуют выделения, но не являются основными элементами
        onPrimary: AppColors.accentColor,// onPrimary -
        //Цвет элементов, которые располагаются на фоне primary
        onSecondary: AppColors.accentColor, // onSecondary -
        //Цвет элементов, которые располагаются на фоне secondary.
        background: AppColors.backgroundColor,// background -
        //Цвет фона основных поверхностей приложения (например, Scaffold).
        surface: AppColors.surfaceColor,// surface - Цвет поверхности
        // элементов интерфейса, таких как карточки, листы, меню и диалоги.
        onSurface: Colors.black,//onSurface -
        //Цвет элементов, которые располагаются на фоне surface.
        error: AppColors.errorColor,// error -
        // Цвет, используемый для элементов, указывающих на ошибку.
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        titleTextStyle: TextStyle(color: AppColors.primaryColor, fontSize: 20),
        iconTheme: IconThemeData(color: AppColors.accentColor,),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.primaryColor),
        // bodyMedium: TextStyle(color: Colors.grey, fontSize: 14),
        // headlineLarge: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        // headlineSmall: TextStyle(color: Colors.black, fontSize: 20),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      // Добавьте другие настройки темы, которые вам нужны
    );
  }


// DarkTheme на будущее
//   static ThemeData get darkTheme {
//     return ThemeData(
//       colorScheme: const ColorScheme.dark(
//         primary: AppColors.primaryColor,
//         secondary: AppColors.secondaryColor,
//         onPrimary: Colors.white,
//         onSecondary: Colors.black,
//         // Добавьте другие цвета, которые вам нужны
//       ),
//       buttonTheme: const ButtonThemeData(
//         buttonColor: AppColors.primaryColor,
//         textTheme: ButtonTextTheme.primary,
//       ),
//       // Добавьте другие настройки темы, которые вам нужны
//     );
//   }
}
