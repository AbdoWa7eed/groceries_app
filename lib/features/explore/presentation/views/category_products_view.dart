import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/widgets/custom_back_button.dart';
import 'package:groceries_app/core/widgets/products_grid_view.dart';

class CategoryProductsView extends StatefulWidget {
  const CategoryProductsView({super.key, required this.title});
  final String title;

  @override
  State<CategoryProductsView> createState() => _CategoryProductsViewState();
}

class _CategoryProductsViewState extends State<CategoryProductsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(
          widget.title,
          style: StylesManager.bold24,
        ),
      ),
      body: const ProductsGridView(products: []),
    );
  }
}
