import 'package:groceries_app/core/network/api_result.dart';

abstract class BaseUseCase<In, Out> {
  ResultFuture<Out> execute(In input);
}
