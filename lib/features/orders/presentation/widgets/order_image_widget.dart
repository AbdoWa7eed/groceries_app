import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/widgets/custom_network_image.dart';

class OrderImageWidget extends StatelessWidget {
  const OrderImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        CustomNetworkImage(
          imageUrl: 'https://iili.io/dWnlR3v.png',
          width: AppSize.s80,
          height: AppSize.s80,
          fit: BoxFit.contain,
        ),
        Positioned(
          bottom: -AppSize.s12,
          right: -AppSize.s12,
          child: CustomNetworkImage(
            imageUrl: 'https://iili.io/dWncTdl.png',
            width: AppSize.s65,
            height: AppSize.s65,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
