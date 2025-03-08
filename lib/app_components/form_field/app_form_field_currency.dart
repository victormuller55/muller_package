import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:muller_package/app_components/form_field/app_form_field.dart';
import 'package:muller_package/muller_package.dart';

class AppCurrencyFormField extends AppFormField {
  AppCurrencyFormField({
    required super.context,
    required super.hint,
    super.width,
    super.paddingHeight,
    super.radius,
    super.inputColor,
    super.backgroundColor,
    super.suffixIcon,
    super.icon,
    super.validator,
  }) : super(
    textInputType: TextInputType.number,
    textInputFormatter: TextInputFormatter.withFunction((oldValue, newValue) {
      final numericValue = double.tryParse(newValue.text.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      final formattedValue = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$ ',).format(numericValue / 100);
      return TextEditingValue(text: formattedValue, selection: TextSelection.collapsed(offset: formattedValue.length));
      },
    ),
  );
}
