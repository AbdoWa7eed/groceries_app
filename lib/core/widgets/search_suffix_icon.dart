import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';

class SearchSuffixIcon extends StatefulWidget {
  const SearchSuffixIcon(
      {super.key, required this.controller, required this.isVisible});
  final TextEditingController? controller;
  final bool isVisible;

  @override
  State<SearchSuffixIcon> createState() => _SearchSuffixIconState();
}

class _SearchSuffixIconState extends State<SearchSuffixIcon> {
  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final text = widget.controller?.text;
    if ((text?.length ?? 0) <= 1) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:
          widget.isVisible && (widget.controller?.text.isNotEmpty ?? false),
      child: GestureDetector(
        onTap: () {
          widget.controller?.clear();
        },
        child: Padding(
          padding: const EdgeInsetsDirectional.only(end: AppPadding.p8),
          child: SvgPicture.asset(
            AssetsManager.clearIcon,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onTextChanged);
    super.dispose();
  }
}
