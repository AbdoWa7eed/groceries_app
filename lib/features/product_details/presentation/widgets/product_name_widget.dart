import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:groceries_app/features/product_details/presentation/widgets/favorite_button_widget.dart';

class ProductDetailsNameWidget extends StatelessWidget {
  const ProductDetailsNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        final cubit = context.read<ProductDetailsCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cubit.productDetailsEntity.name,
                  style: StylesManager.bold24,
                ),
                const SizedBox(
                  height: AppSize.s4,
                ),
                Text(
                  cubit.productDetailsEntity.description,
                  style: StylesManager.medium16
                      .copyWith(color: ColorManager.darkGray),
                )
              ],
            ),
            FavoriteButtonWidget(
              initialValue: cubit.productDetailsEntity.isFavorite,
              onChanged: (value) {
                cubit.addToFavorites();
              },
            )
          ],
        );
      },
    );
  }
}
