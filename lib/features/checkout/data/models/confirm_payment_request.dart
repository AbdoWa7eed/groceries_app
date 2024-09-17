class ConfirmPaymentRequest {
  final String orderId;
  final String paymentLink;

  ConfirmPaymentRequest({required this.orderId, required this.paymentLink});
}
