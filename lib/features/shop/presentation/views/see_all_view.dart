import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/widgets/custom_back_button.dart';
import 'package:groceries_app/core/widgets/custom_floating_widgets.dart';
import 'package:groceries_app/core/widgets/products_grid_view.dart';
import 'package:groceries_app/features/shop/presentation/cubit/shop_cubit.dart';

class SeeAllProductsView extends StatefulWidget {
  const SeeAllProductsView({super.key, required this.title});
  final String title;

  @override
  State<SeeAllProductsView> createState() => _SeeAllProductsViewState();
}

class _SeeAllProductsViewState extends State<SeeAllProductsView> {
  bool _isSnackbarShown = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        if (state is GetMoreGroceriesError && (!_isSnackbarShown)) {
          showSnackBar(context, text: state.error);
          _isSnackbarShown = true;
        }
      },
      builder: (context, state) {
        final cubit = context.read<ShopCubit>();
        return Scaffold(
            appBar: AppBar(
              title: Text(widget.title, style: StylesManager.bold24),
              leading: const CustomBackButton(),
            ),
            body: ProductsGridView(
              products: cubit.currentList,
              onScroll: () async {
                if (widget.title == AppStrings.groceries) {
                  cubit.getMoreGroceries();
                }
              },
            ));
      },
    );
  }
}
