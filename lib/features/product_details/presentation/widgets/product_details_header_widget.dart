import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:groceries_app/features/product_details/presentation/widgets/product_details_image.dart';

class ProductsDetailsHeader extends StatelessWidget {
  const ProductsDetailsHeader({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        final cubit = context.read<ProductDetailsCubit>();
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          height: height * 0.3,
          width: double.infinity,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const BoxDecoration(
              color: ColorManager.imageBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppSize.s40),
                bottomRight: Radius.circular(AppSize.s40),
              )),
          child: ProductDetailsImage(
            imageUrl: cubit.productDetailsEntity.imageUrl,
          ),
        );
      },
    );
  }
}
