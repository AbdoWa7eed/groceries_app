enum PaymentMethodsEnum { cash, paymob, other }

enum LocationPurpose {
  newAccount,
  changeAddress,
  delivery,
}

enum PhoneAuthPurpose {
  newAccount,
  change,
}

enum PaymentUrlType { success, redirect, pending, error }

enum OrderStatus {
  processing,
  shipped,
  delivered,
}

enum OrderPaymentStatus {
  pending,
  paid,
}
