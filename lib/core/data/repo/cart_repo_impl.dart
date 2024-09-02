import 'package:dartz/dartz.dart';
import 'package:groceries_app/core/data/data_source/cart_data_source.dart';
import 'package:groceries_app/core/data/models/cart/cart_request_body.dart';
import 'package:groceries_app/core/data/models/mapper.dart';
import 'package:groceries_app/core/domain/entities/cart_entity.dart';
import 'package:groceries_app/core/domain/repo/cart_repo.dart';
import 'package:groceries_app/core/network/api_result.dart';
import 'package:groceries_app/core/network/error_handler.dart';
import 'package:groceries_app/core/network/failure.dart';

class CartRepositoryImpl implements CartRepository {
  final CartDataSource _cartDataSource;
  CartRepositoryImpl(this._cartDataSource);
  @override
  ResultFuture<String> addAllToCart(
      List<CartRequestBody> cartRequestBodyList) async {
    try {
      final result = await _cartDataSource.addAllToCart(cartRequestBodyList);
      return Right(result.message);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<String> addToCart(CartRequestBody cartRequestBody) async {
    try {
      final result = await _cartDataSource.addToCart(cartRequestBody);
      return Right(result.message);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<CartEntity> getCart() async {
    try {
      final result = await _cartDataSource.getCart();
      if (result.data == null) {
        return Left(Failure.apiInternalError(result.message));
      }
      return Right(result.data!.toEntity());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<String> removeFromCart(int productId) async {
    try {
      final result = await _cartDataSource.removeFromCart(productId);
      return Right(result.message);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  ResultFuture<String> updateItemQuantity(
      CartRequestBody cartRequestBody) async {
    try {
      final result = await _cartDataSource.updateItemQuantity(cartRequestBody);
      if (result.data == null) {
        return Left(Failure.apiInternalError(result.message));
      }
      return Right(result.message);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
