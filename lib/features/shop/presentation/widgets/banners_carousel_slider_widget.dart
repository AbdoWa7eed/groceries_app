import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/widgets/custom_network_image.dart';
import 'package:groceries_app/features/shop/presentation/cubit/shop_cubit.dart';

class BannersCarouselWidget extends StatelessWidget {
  const BannersCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        final cubit = context.read<ShopCubit>();
        return CarouselSlider.builder(
          itemCount: cubit.banners.length,
          options: CarouselOptions(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            aspectRatio: 5 / 2,
            autoPlay: true,
            viewportFraction: 1,
          ),
          itemBuilder: (context, index, realIndex) {
            return Card(
              elevation: 0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: CustomNetworkImage(
                width: double.infinity,
                imageUrl: cubit.banners[index].imageUrl,
              ),
            );
          },
        );
      },
    );
  }
}
