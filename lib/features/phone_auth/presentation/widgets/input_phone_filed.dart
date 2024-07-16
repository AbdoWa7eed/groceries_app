import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:groceries_app/core/res/strings_manager.dart';
import 'package:groceries_app/core/res/values_manager.dart';
import 'package:groceries_app/features/phone_auth/presentation/widgets/phone_confirnation_dialog.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class InputPhoneField extends StatefulWidget {
  const InputPhoneField({super.key});

  @override
  State<InputPhoneField> createState() => _InputPhoneFieldState();
}

class _InputPhoneFieldState extends State<InputPhoneField> {
  final _formKey = GlobalKey<FormState>();
  PhoneNumber? number;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: InternationalPhoneNumberInput(
        formatInput: true,
        spaceBetweenSelectorAndTextField: AppPadding.p4,
        onFieldSubmitted: (value) {},
        validator: ValidationBuilder().phone().build(),
        keyboardType: TextInputType.phone,
        countrySelectorScrollControlled: false,
        selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
        onSubmit: () {
          if (_formKey.currentState!.validate()) {
            showDialog(
              context: context,
              builder: (context) {
                return PhoneConfirmationDialog(
                  phoneNumber: number!.phoneNumber.toString(),
                );
              },
            );
          }
        },
        onInputChanged: (value) {
          number = value;
        },
        inputDecoration:
            const InputDecoration(labelText: AppStrings.phoneNumber),
      ),
    );
  }
}
