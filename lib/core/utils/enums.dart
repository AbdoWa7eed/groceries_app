enum PaymentMethodsEnum { cash, paymob }

extension PaymentMethodsEnumName on PaymentMethodsEnum {
  String get name => toString().substring(toString().indexOf('.') + 1);
}
