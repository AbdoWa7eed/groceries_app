import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/core/utils/enums.dart';
import 'package:groceries_app/features/checkout/presentation/cubit/confirm_payment_cubit.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/confirm_payment_loading_dialog.dart';
import 'package:groceries_app/features/checkout/presentation/widgets/linear_indicator_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ConfirmPaymentViewBody extends StatefulWidget {
  const ConfirmPaymentViewBody({super.key});

  @override
  State<ConfirmPaymentViewBody> createState() => _ConfirmPaymentViewBodyState();
}

class _ConfirmPaymentViewBodyState extends State<ConfirmPaymentViewBody> {
  late final WebViewController controller;
  late bool isConfirmed;

  @override
  void initState() {
    super.initState();
    isConfirmed = false;
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(context.read<ConfirmPaymentCubit>().currentUrl));
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ConfirmPaymentCubit>();
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        WebViewWidget(
          controller: controller
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {
                  cubit.updateProgress(progress);
                },
                onNavigationRequest: (NavigationRequest request) {
                  cubit.updateUrl(request.url);
                  if (cubit.getUrlType() == PaymentUrlType.redirect) {
                    if (!isConfirmed) {
                      isConfirmed = true;
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const ConfirmPaymentLoadingDialog();
                        },
                      );
                      cubit.confirmPayment();
                    }
                  }
                  return NavigationDecision.navigate;
                },
              ),
            ),
        ),
        const LinearIndicatorWidget(),
      ],
    );
  }
}
