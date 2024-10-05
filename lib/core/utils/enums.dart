enum PaymentMethodsEnum { cash, paymob }

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
