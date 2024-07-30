import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/core/widgets/custom_network_image.dart';

class BannersCarouselWidget extends StatelessWidget {
  const BannersCarouselWidget({super.key});

  static const List<String> _images = [
    'https://iili.io/J1DI1ea.jpg',
    'https://img.freepik.com/free-photo/isolated-citrus-fruit-row-against-yellow-background-green-lime-apple-lemon-cumquat-orange-fortunella-peach-nutritious-tropical-fruits-offering-host-vitamins-keep-you-healthy_273609-38044.jpg?w=996&t=st=1707772202~exp=1707772802~hmac=8d617d6bd31f259116a7e29dabb2b53b99dfeb13ffa3fb0596c648427e703ab5',
    'https://img.freepik.com/free-photo/flat-lay-arrangement-with-cauliflower-radish_23-2148287522.jpg?w=996&t=st=1707772942~exp=1707773542~hmac=f7ef7bd9a4e833248d4eac4572db2526e650f5118ab6857af529e8294273c454'
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: _images.length,
      options: CarouselOptions(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          aspectRatio: 5 / 2,
          autoPlay: true,
          viewportFraction: 1,
          enlargeStrategy: CenterPageEnlargeStrategy.height),
      itemBuilder: (context, index, realIndex) {
        return Card(
          elevation: 0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: CustomNetworkImage(
            imageUrl: _images[index],
            width: double.infinity,
          ),
        );
      },
    );
  }
}
