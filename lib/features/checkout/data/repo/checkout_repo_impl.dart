import 'package:dartz/dartz.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/network/error_handler.dart';
import 'package:groceries_app/core/network/failure.dart';
import 'package:groceries_app/features/checkout/data/data_source/checkout_data_source.dart';
import 'package:groceries_app/features/checkout/data/mappers/checkout_mapper.dart';
import 'package:groceries_app/features/checkout/data/models/confirm_payment_request.dart';
import 'package:groceries_app/features/checkout/data/models/place_order_request_model.dart';
import 'package:groceries_app/features/checkout/domain/entity/place_order_entity.dart';
import 'package:groceries_app/features/checkout/domain/repo/checkout_repository.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  final CheckoutDataSource _checkOutDataSource;

  CheckoutRepositoryImpl(this._checkOutDataSource);

  @override
  ResultFuture<String> confirmPayment(ConfirmPaymentRequest request) async {
    try {
      final result = await _checkOutDataSource.confirmPayment(request);
      return Right(result.message);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<PlaceOrderEntity> placeOrder(
      OrderRequestModel orderRequestModel) async {
    try {
      final result = await _checkOutDataSource.placeOrder(orderRequestModel);
      if (result.data == null) {
        return Left(Failure.apiInternalError(result.message));
      }
      return Right(result.data!.toEntity());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
