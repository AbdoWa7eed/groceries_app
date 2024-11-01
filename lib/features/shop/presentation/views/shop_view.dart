import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/error_widget.dart';
import 'package:groceries_app/features/shop/presentation/cubit/shop_cubit.dart';
import 'package:groceries_app/features/shop/presentation/widgets/shimmer/shop_shimmer_loading.dart';
import 'package:groceries_app/features/shop/presentation/widgets/shop_view_body.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
            ),
            floating: true,
            title: SvgPicture.asset(
              height: AppSize.s40,
              AssetsManager.carrotLogo,
              width: AppSize.s40,
            ),
            centerTitle: true,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: BlocBuilder<ShopCubit, ShopState>(
              builder: (context, state) {
                final cubit = context.read<ShopCubit>();
                if (state is ShopLoading) {
                  return const ShopShimmerLoading();
                } else if (state is ShopError) {
                  return CustomErrorWidget(
                    error: state.error,
                    onTryAgain: () {
                      cubit.initShopData();
                    },
                  );
                } else {
                  return const ShopViewBody();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
