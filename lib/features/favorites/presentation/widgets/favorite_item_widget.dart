import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/domain/entities/product_entity.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/widgets/custom_network_image.dart';
import 'package:groceries_app/core/widgets/product/product_title_widget.dart';
import 'package:groceries_app/features/favorites/presentation/cubit/favorite_cubit.dart';

class FavoriteItemWidget extends StatelessWidget {
  final ProductEntity product;
  const FavoriteItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        context.read<FavoriteCubit>().removeFromFavorite(product);
      },
      key: Key(product.productId.toString()),
      child: GestureDetector(
        onTap: () {
          context.push(Routes.productDetails, extra: product.productId);
        },
        child: SizedBox(
          height: AppSize.s120,
          child: Row(
            children: [
              CustomNetworkImage(
                imageUrl: product.imageUrl,
                fit: BoxFit.contain,
                height: AppSize.s80,
                width: AppSize.s100,
              ),
              const SizedBox(width: AppSize.s12),
              Expanded(
                child: ProductTitleWidget(
                  description: product.description,
                  productName: product.name,
                ),
              ),
              const SizedBox(width: AppSize.s12),
              Row(
                children: [
                  Text(
                    '${product.price}\$',
                    style: StylesManager.bold16,
                  ),
                  const SizedBox(width: AppSize.s12),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorManager.dark,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
