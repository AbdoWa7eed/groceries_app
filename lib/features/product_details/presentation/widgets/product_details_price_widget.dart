import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:groceries_app/features/product_details/presentation/widgets/quantity_counter_widget.dart';

class ProductDetailsPriceWidget extends StatefulWidget {
  const ProductDetailsPriceWidget({super.key});

  @override
  State<ProductDetailsPriceWidget> createState() =>
      _ProductDetailsPriceWidgetState();
}

class _ProductDetailsPriceWidgetState extends State<ProductDetailsPriceWidget> {
  late final ProductDetailsCubit _cubit;
  @override
  void initState() {
    _cubit = context.read<ProductDetailsCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          QuantityCounterWidget(
            onQuantityChanged: (value) {
              setState(() {
                _cubit.quantity = value;
              });
            },
          ),
          Text('\$$price', style: StylesManager.bold24),
        ],
      ),
    );
  }

  String get price =>
      (_cubit.productDetailsEntity.price * _cubit.quantity).toStringAsFixed(2);
}
