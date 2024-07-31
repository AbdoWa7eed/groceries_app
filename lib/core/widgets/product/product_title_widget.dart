import 'package:flutter/cupertino.dart';
import 'package:groceries_app/core/res/styles_manager.dart';

class ProductTitleWidget extends StatelessWidget {
  final String productName;
  final String description;
  const ProductTitleWidget(
      {super.key, required this.description, required this.productName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: StylesManager.bold16,
        ),
        Text(
          description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: StylesManager.medium14,
        ),
      ],
    );
  }
}
