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
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        final cubit = context.read<ProductDetailsCubit>();
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuantityCounterWidget(
                onQuantityChanged: (value) {
                  quantity = value;
                  setState(() {});
                },
              ),
              Text('\$${_getPrice(cubit.productDetailsEntity.unitPrice)}',
                  style: StylesManager.bold24),
            ],
          ),
        );
      },
    );
  }

  String _getPrice(double price) {
    return (price * quantity).toStringAsFixed(2);
  }
}
