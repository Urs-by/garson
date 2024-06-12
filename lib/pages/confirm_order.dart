import 'package:flutter/material.dart';
import 'package:garson/text_titles.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  final int _duration = 100;
  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(confirm),
      ),
      body: Center(
        child: CircularCountDownTimer(
          duration: 10,
          initialDuration: 0,
          controller: CountDownController(),
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          ringColor: Colors.grey[300]!,
          ringGradient: null,
          fillColor: Colors.orangeAccent[100]!,
          fillGradient: null,
          backgroundColor: Colors.orange[500],
          backgroundGradient: null,
          strokeWidth: 20.0,
          strokeCap: StrokeCap.round,
          textStyle: TextStyle(
              fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
          textFormat: CountdownTextFormat.S,
          isReverse: false,
          isReverseAnimation: false,
          isTimerTextShown: true,
          autoStart: true,
          onStart: () {
            debugPrint('Countdown Started');
          },
          onComplete: () {
            debugPrint('Countdown Ended');
          },
          onChange: (String timeStamp) {
            debugPrint('Countdown Changed $timeStamp');
          },
          timeFormatterFunction: (defaultFormatterFunction, duration) {
            if (duration.inSeconds == 0) {
              return "Уже несут";
            } else {
              return Function.apply(defaultFormatterFunction, [duration]);
            }
          },
        ),
      )
    );
  }
}

// Widget _button({required String title, VoidCallback? onPressed}) {
//   return Expanded(
//     child: ElevatedButton(
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all(Colors.purple),
//       ),
//       onPressed: onPressed,
//       child: Text(
//         title,
//         style: const TextStyle(color: Colors.white),
//       ),
//     ),
//   );
// }
