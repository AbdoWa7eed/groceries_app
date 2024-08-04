import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/widgets/custom_back_button.dart';
import 'package:groceries_app/core/widgets/custom_snackbar.dart';
import 'package:groceries_app/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:groceries_app/features/product_details/presentation/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      listener: (context, state) {
        if (state is UpdateFavoriteSuccess) {
          showSnackBar(context,
              text: state.message, color: ColorManager.primary);
        }

        if (state is UpdateFavoriteError) {
          showSnackBar(context, text: state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(slivers: [
            SliverAppBar(
              leading: const CustomBackButton(),
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark),
              backgroundColor: state is GetProductDetailsLoading ||
                      state is GetProductDetailsError
                  ? null
                  : ColorManager.imageBackground,
            ),
            const SliverToBoxAdapter(child: ProductDetailsViewBody()),
          ]),
        );
      },
    );
  }
}
