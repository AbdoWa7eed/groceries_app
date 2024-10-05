import 'dart:developer' as dev;

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension NavigationExtension on BuildContext {
  void popAllThenPush(String location, {Object? extra}) {
    popAll(extra: extra);
    pushReplacement(location, extra: extra);
  }

  Future<void> popAll({Object? extra}) async {
    while (canPop()) {
      pop(extra);
    }
  }

  void popAllButOne() {
    var router = GoRouter.of(this);
    var currentRoute = router.routerDelegate.currentConfiguration.routes;
    while (currentRoute.length > 1) {
      router.pop();
      currentRoute = router.routerDelegate.currentConfiguration.routes;
    }
  }
}

extension EitherX<Failure, R> on Either<Failure, R> {
  R get right => (this as Right<Failure, R>).value;

  Failure get failure => (this as Left<Failure, R>).value;
}

extension StringExtenstions on String? {
  bool get _isNull => this == null;
  String orEmpty() {
    if (_isNull) {
      return "";
    } else {
      return this!;
    }
  }

  String get capitalizeFirstLetter {
    if (_isNull || this!.isEmpty) return "";
    return '${this![0].toUpperCase()}${this!.substring(1)}';
  }

  bool get isFormattedAddress => RegExp(
          r'^[A-Za-z0-9]+\+?[A-Za-z0-9]*,\s*[A-Za-z\s]+,\s*[A-Za-z\s]+,\s*[A-Za-z\s]+,\s*[A-Za-z\s]+$')
      .hasMatch(this ?? '');

  String formattedAddress() {
    final parts = this?.split(',');
    if (RegExp(r'^[A-Za-z0-9]+\+[A-Za-z0-9]+').hasMatch(parts?[0] ?? '')) {
      return '${parts?.sublist(1).join(',')}';
    }

    return this!;
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

extension IterableExensions<T> on Iterable<T> {
  Iterable<T> getOnlyNewItems(Iterable<T> newItems) {
    final existingItems = Set<T>.from(this);

    newItems = newItems.where((element) => !existingItems.contains(element));
    return newItems.toList();
  }

  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
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
