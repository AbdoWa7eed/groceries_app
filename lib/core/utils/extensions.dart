import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension NavigationExtension on BuildContext {
  void popAllThenPush(String location , {Object? extra}) {
    while (canPop()) {
      pop();
    }
    pushReplacement(location , extra: extra);
  }
}

extension EitherX<Failure, R> on Either<Failure, R> {
  R get right => (this as Right<Failure, R>).value;

  Failure get failure => (this as Left<Failure, R>).value;
}

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}



extension NonNullDouble on double? {
  double orZero() {
    if (this == null) {
      return 0.0;
    } else {
      return this!;
    }
  }
}


extension ScrollControllerExtension on ScrollController {

  bool isReached70PrecentPosition(){
    final maxScroll = position.maxScrollExtent;
    final currentScroll = position.pixels;
    final delta = 0.3 * maxScroll;
    return (maxScroll - currentScroll) <= delta;
  }
}