import 'package:flutter/material.dart';
import 'package:muller_package/muller_package.dart';

OutlineInputBorder _border({double? radius, double? width, Color? color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color ?? Colors.transparent, width: width ?? 0.5),
    borderRadius: BorderRadius.circular(radius ?? 40),
  );
}

TextStyle _style({Color? color}) {
  return TextStyle(fontFamily: 'lato', fontSize: 13, color: color ?? Colors.black);
}

class AppDropdown<T> {
  late final Widget dropdown;
  List<T> items;
  T? selectedValue;

  AppDropdown({
    required this.items, // Mantém como obrigatório
    required String hint,
    T? defaultValue,
    double? width,
    double? paddingHeight,
    double? radius,
    Color? backgroundColor,
    Color? inputColor,
    Icon? icon,
    void Function(T?)? onChanged,
    String? Function(T?)? validator,
  }) {
    selectedValue = defaultValue;

    dropdown = Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: width,
        child: DropdownButtonFormField<T>(
          value: selectedValue,
          style: _style(color: inputColor),
          decoration: InputDecoration(
            filled: true,
            prefixIcon: icon,
            fillColor: backgroundColor ?? AppColors.white,
            border: _border(radius: radius),
            enabledBorder: _border(radius: radius),
            focusedBorder: _border(radius: radius),
            errorBorder: _border(color: AppColors.red),
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(vertical: paddingHeight ?? 10.0, horizontal: 25),
            hintStyle: _style(color: Colors.grey.shade400),
          ),
          dropdownColor: backgroundColor,
          validator: validator,
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: appText(item.toString()),
            );
          }).toList(),
          onChanged: (value) {
            selectedValue = value;
            if (onChanged != null) onChanged(value);
          },
        ),
      ),
    );
  }

  T? get value => selectedValue;

  set value(T? newValue) {
    selectedValue = newValue;
  }

  Widget get widget => dropdown;
}
