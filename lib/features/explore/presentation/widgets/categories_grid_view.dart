import 'package:flutter/material.dart';
import 'package:groceries_app/core/domain/entities/category_entity.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/explore/presentation/widgets/category_container_widget.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key, required this.categories});

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsetsDirectional.only(top: AppPadding.p20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.2,
            crossAxisSpacing: AppSize.s14,
            mainAxisSpacing: AppSize.s14),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryContainerWidget(
            category: categories[index],
            color: colors[index % colors.length],
          );
        });
  }

  static const colors = [
    Colors.green,
    Colors.yellow,
    Colors.red,
    Colors.blue,
    Colors.orange,
    Colors.cyan,
  ];
}
