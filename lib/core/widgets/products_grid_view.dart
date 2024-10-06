import 'package:flutter/material.dart';
import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/utils/extensions.dart';
import 'package:groceries_app/core/widgets/empty_screen_widget.dart';
import 'package:groceries_app/core/widgets/product/product_card_widget.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({super.key, required this.products, this.onScroll});
  final List<ProductEntity> products;
  final Function()? onScroll;

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  ScrollController? _scrollController;
  bool? _isFetching;

  @override
  void initState() {
    super.initState();

    if (widget.onScroll != null) {
      _scrollController = ScrollController();
      _isFetching = false;
      _scrollController?.addListener(_fetchMoreData);
    }
  }

  _fetchMoreData() async {
    if (_isFetching!) return;
    if (_scrollController!.isReached70PercentPosition()) {
      _isFetching = true;
      await widget.onScroll?.call();
      await Future.delayed(const Duration(seconds: 1), () {
        _isFetching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (widget.products.isEmpty) {
        return const CustomEmptyScreen(text: AppStrings.noProductsFound);
      }
      return GridView.builder(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.p16,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: AppSize.s8,
              mainAxisSpacing: AppSize.s8),
          itemCount: widget.products.length,
          itemBuilder: (context, index) {
            return ProductCardWidget(entity: widget.products[index]);
          });
    });
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }
}
