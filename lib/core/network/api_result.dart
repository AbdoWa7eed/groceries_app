import 'package:dartz/dartz.dart';
import 'package:groceries_app/core/network/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
