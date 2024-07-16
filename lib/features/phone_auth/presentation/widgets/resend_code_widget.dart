import 'dart:async';
import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';

class ResendCodeWidget extends StatefulWidget {
  const ResendCodeWidget({super.key});

  @override
  State<ResendCodeWidget> createState() => _ResendCodeWidgetState();
}

class _ResendCodeWidgetState extends State<ResendCodeWidget> {
  late Timer _timer;
  late int _currentTime;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _currentTime = 60;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_currentTime > 0) {
          setState(() {
            _currentTime--;
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: _currentTime == 0
              ? () {
                  setState(() {
                    startTimer();
                  });
                }
              : null,
          child: Text(
            AppStrings.resendCode,
            style: StylesManager.medium18.copyWith(
              color: _currentTime == 0 ? ColorManager.primary : Colors.grey,
            ),
          ),
        ),
        Visibility(
          visible: _currentTime != 0,
          child: Text(
            '$_currentTime s',
            style: StylesManager.medium18.copyWith(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
