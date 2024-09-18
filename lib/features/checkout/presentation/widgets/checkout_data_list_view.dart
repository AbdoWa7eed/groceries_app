import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/res/color_manager.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/styles_manager.dart';
import 'package:groceries_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:groceries_app/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/checkout_list_item.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/checkout_list_view_item_model.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/payment_methods_dialog.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/payment_suffix_icon.dart';

class CheckoutDataListView extends StatefulWidget {
  const CheckoutDataListView({super.key});

  @override
  State<CheckoutDataListView> createState() => _CheckoutDataListViewState();
}

class _CheckoutDataListViewState extends State<CheckoutDataListView> {
  late List<CheckoutListViewItemModel> _items;

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
            return CheckoutListItem(model: _buildItems()[index]);
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
          suffix: const PaymentSuffixIcon(),
          onTap: _showPaymentMethodsDialog),
      CheckoutListViewItemModel(
        title: AppStrings.totalAmount,
        suffix: _buildSuffixText('\$$totalPrice'),
      ),
    ];
  }

  String get totalPrice => context.read<CartCubit>().cartPrice;

  Widget _buildSuffixText(String text) {
    return Text(text,
        style: StylesManager.semiBold18.copyWith(color: ColorManager.dark));
  }

  void _showPaymentMethodsDialog() {
    final cubit = context.read<CheckoutCubit>();
    showDialog(
        context: context,
        builder: (context) {
          return BlocProvider<CheckoutCubit>.value(
            value: cubit,
            child: const PaymentMethodsDialog(),
          );
        });
  }
}
