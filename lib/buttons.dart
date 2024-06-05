import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final String buttonText;
  // final VoidCallback onPressed;
  final String underButtonText;

  const StartButton({super.key,
    required this.buttonText,
    // required this.onPressed,
    required this.underButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          child: TextButton(
            onPressed: (){},
            style: TextButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
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
