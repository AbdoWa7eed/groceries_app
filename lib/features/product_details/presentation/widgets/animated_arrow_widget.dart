import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/utils/ui_constants.dart';

class AnimatedArrowWidget extends StatefulWidget {
  const AnimatedArrowWidget({super.key, this.onTurn});

  final Function(bool isTurned)? onTurn;
  @override
  State<AnimatedArrowWidget> createState() => _AnimatedArrowWidgetState();
}

class _AnimatedArrowWidgetState extends State<AnimatedArrowWidget> {
  bool isTurned = false;
  double turns = 0;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(_animateText);
          widget.onTurn?.call(isTurned);
        },
        iconSize: AppSize.s22,
        icon: AnimatedRotation(
          turns: turns,
          duration: const Duration(milliseconds: UiConstants.arrowTurnDelay),
          child: const Icon(Icons.arrow_forward_ios_rounded),
        ));
  }

  void _animateText() {
    if (isTurned) {
      turns -= 0.25;
    } else {
      turns += 0.25;
    }
    isTurned = !isTurned;
  }
}
