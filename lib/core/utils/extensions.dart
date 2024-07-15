import 'package:dartz/dartz.dart';

extension EitherX<Failure, R> on Either<Failure, R> {
  R get right => (this as Right<Failure, R>).value;

  Failure get failure => (this as Left<Failure, R>).value;
}


extension NonNullString on String?{
  String orEmpty(){
    if(this == null) {
      return "";
    } else {
      return this!;
    }

  }
}

extension NonNullInteger on int?{
  int orZero(){
    if(this == null) {
      return 0;
    } else {
      return this!;
    }

  }
}

