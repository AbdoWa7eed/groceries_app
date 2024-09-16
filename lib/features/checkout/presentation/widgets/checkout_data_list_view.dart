import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries_app/core/res/assets_manager.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/checkout_list_item.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/checkout_list_view_item_model.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/payment_methods_dialog.dart';

class CheckoutDataListView extends StatefulWidget {
  const CheckoutDataListView({super.key});

  @override
  State<CheckoutDataListView> createState() => _CheckoutDataListViewState();
}

class _CheckoutDataListViewState extends State<CheckoutDataListView> {
  late final List<CheckoutListViewItemModel> _items;

  @override
  void initState() {
    super.initState();
    _items = _buildItems();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CheckoutListItem(model: _items[index]);
          },
          separatorBuilder: (context, index) {
            return const Divider(color: ColorManager.lightGray);
          },
          itemCount: _items.length),
    );
  }



  List<CheckoutListViewItemModel> _buildItems() {
    return [
      CheckoutListViewItemModel(
          title: AppStrings.deliveryAddress,
          suffix: _buildSuffixText(AppStrings.change),
          onTap: () {}),
      CheckoutListViewItemModel(
          title: AppStrings.paymentMethod,
          suffix: SvgPicture.asset(AssetsManager.card),
          onTap: _showPaymentMethodsDialog),
      CheckoutListViewItemModel(
          title: AppStrings.totalAmount, suffix: _buildSuffixText('\$60.30')),
    ];
  }

  Widget _buildSuffixText(String text) {
    return Text(text,
        style: StylesManager.semiBold18.copyWith(color: ColorManager.dark));
  }

  void _showPaymentMethodsDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return const PaymentMethodsDialog();
        });
  }

}
