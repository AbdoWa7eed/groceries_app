
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:groceries_app/features/shop/presentation/widgets/products_list_view.dart';
import 'package:groceries_app/features/shop/presentation/widgets/section_text_widget.dart';

class BestSellingSectionWidget extends StatelessWidget {
  const BestSellingSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        final cubit = context.read<ShopCubit>();
        return Column(
          children: [
            SectionTextWidget(
              text: AppStrings.bestSelling,
              onSeeAllPressed: () {},
            ),
            ProductsListView(products: cubit.bestSelling),
          ],
        );
      },
    );
  }
}



