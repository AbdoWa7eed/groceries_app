import 'package:flutter/material.dart';
import 'package:groceries_app/core/widgets/add_item_to_cart_listener.dart';
import 'package:groceries_app/features/product_details/presentation/views/product_details_listener.dart';
import 'package:groceries_app/features/product_details/presentation/widgets/product_details_app_bar.dart';
import 'package:groceries_app/features/product_details/presentation/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductDetailsListener(
      child: AddItemToCartListener(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              ProductDetailsAppBar(),
              SliverFillRemaining(
                hasScrollBody: false,
                child: ProductDetailsViewBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
