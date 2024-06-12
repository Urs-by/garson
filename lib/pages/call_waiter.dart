import 'package:flutter/material.dart';
import 'package:garson/text_titles.dart';
import 'package:garson/colors.dart';
import 'package:garson/pages/confirm_order.dart';

class CallWaiter extends StatelessWidget {
  const CallWaiter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          bring,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            // CustomColumn() - кнопки с картинками
            const CustomColumn(),
            const SizedBox(
              height: 10,
            ),
            // блок с полем для воода и кнопкой отправки заказа
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: const TextField(
                  maxLength: 100,
                  style: TextStyle(
                    fontSize: 16, // Размер шрифта для вводимого текста
                    color: Colors.black, // Цвет текста для вводимого текста
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: whatYouLike,
                    labelStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 300, // Задаем фиксированную ширину кнопки
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.buttonBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConfirmOrder()),
                  );
                },
                child: const Text(
                  order,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomColumn extends StatelessWidget {
  const CustomColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomRow(imagePath: 'images/menu.png', buttonText: buttonMenu),
          SizedBox(
            height: 15,
          ),
          CustomRow(imagePath: 'images/check.png', buttonText: buttonCheck),
          SizedBox(
            height: 15,
          ),
          CustomRow(imagePath: 'images/solt.png', buttonText: buttonSalt),
          SizedBox(
            height: 15,
          ),
          CustomRow(imagePath: 'images/napkin.png', buttonText: buttonNapkins),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  final String imagePath;
  final String buttonText;

  const CustomRow(
      {super.key, required this.imagePath, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 350),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 15),
            SizedBox(
              width: 150, // Задаем фиксированную ширину кнопки
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.buttonBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConfirmOrder()),
                  );
                },
                child: Text(
                  buttonText,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..scale(-1.0, 1.0),
              child: Image.asset(
                imagePath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
