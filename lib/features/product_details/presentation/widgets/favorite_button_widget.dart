import 'package:flutter/material.dart';
import 'package:groceries_app/core/res/color_manager.dart';

class FavoriteButtonWidget extends StatefulWidget {
  const FavoriteButtonWidget(
      {super.key, required this.initialValue, this.onChanged});
  final bool initialValue;
  final Function(bool value)? onChanged;
  @override
  State<FavoriteButtonWidget> createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  late bool isFavorite;

  @override
  void initState() {
    isFavorite = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
          widget.onChanged?.call(isFavorite);
        });
      },
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border_outlined),
      color: isFavorite ? ColorManager.error : null,
    );
  }
}
