import 'dart:developer' as dev;

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension NavigationExtension on BuildContext {
  void popAllThenPush(String location, {Object? extra}) {
    popAll(extra: extra);
    pushReplacement(location, extra: extra);
  }

  void popAll({Object? extra}) {
    while (canPop()) {
      pop(extra);
    }
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
  bool isReached70PercentPosition() {
    final maxScroll = position.maxScrollExtent;
    final currentScroll = position.pixels;
    final delta = 0.3 * maxScroll;
    return (maxScroll - currentScroll) <= delta;
  }
}

extension GetOnlyNewItems<T> on List<T> {
  List<T> getOnlyNewItems(Iterable<T> newItems) {
    final existingItems = Set<T>.from(this);

    newItems = newItems.where((element) => !existingItems.contains(element));
    return newItems.toList();
  }

  int get nextPage => (length ~/ 8) + 1;
}

void logInfo(String msg) {
  dev.log('\x1B[34m$msg\x1B[0m');
}

void logSuccess(String msg) {
  dev.log('\x1B[32m$msg\x1B[0m');
}

void logWarning(String msg) {
  dev.log('\x1B[33m$msg\x1B[0m');
}

void logError(String msg) {
  dev.log('\x1B[31m$msg\x1B[0m');
}
