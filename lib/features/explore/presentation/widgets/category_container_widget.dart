import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groceries_app/core/domain/entities/category_entity.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/core/routes/routes_manager.dart';
import 'package:groceries_app/core/widgets/custom_network_image.dart';

class CategoryContainerWidget extends StatelessWidget {
  const CategoryContainerWidget(
      {super.key, required this.color, required this.category});
  final Color color;
  final CategoryEntity category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.categoryProducts, extra: category);
      },
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          border: Border.all(color: color.withOpacity(0.6)),
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomNetworkImage(
                imageUrl: category.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: AppSize.s20),
            Text(
              category.name,
              textAlign: TextAlign.center,
              style: StylesManager.bold18,
            ),
          ],
        ),
      ),
    );
  }
}
