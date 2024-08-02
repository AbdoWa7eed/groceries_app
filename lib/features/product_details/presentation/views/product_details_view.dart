import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/features/product_details/presentation/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: ColorManager.imageBackground,
      ),
      child: Scaffold(
        body: ProductDetailsViewBody(),
      ),
    );
  }
}
