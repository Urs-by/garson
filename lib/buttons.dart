import 'package:flutter/material.dart';
import 'colors.dart';

class StartButton extends StatelessWidget {
  final String buttonText;
  final Widget page;
  final String underButtonText;

  const StartButton({super.key,
    required this.buttonText,
    required this.page,
    required this.underButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: AppColors.buttonBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Text(underButtonText),
      ],
    );
  }
}
