import 'package:flutter/material.dart';
import 'package:garson/text_titles.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({super.key});

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  final int _duration = 10;
  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(confirm),
      ),
      body: Center(
        child: CircularCountDownTimer(
          duration: _duration,
          initialDuration: 0,
          controller: _controller,
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
          textStyle: const TextStyle(
              fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
          textFormat: CountdownTextFormat.S,
          isReverse: true,
          isReverseAnimation: false,
          isTimerTextShown: true,
          autoStart: true,
          // onStart: () {
          //   debugPrint('Ураа');
          // },
          onComplete: () {

            _controller.restart(duration: _duration);
          },
          onChange: (String timeStamp) {
            debugPrint('Countdown Changed $timeStamp');
          },

        ),
      )
    );
  }
}

