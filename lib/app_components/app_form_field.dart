import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

appFormField(
    BuildContext context, {
      required String hint,
      double? width,
      double? paddingHeight,
      double? radius,
      bool? showSenha,
      bool? enable,
      Icon? icon,
      Color? backgroundColor,
      Color? inputColor,
      TextEditingController? controller,
      TextInputType? textInputType,
      Widget? suffixIcon,
      TextInputFormatter? textInputFormatter,
      String? Function(String? value)? validator,
    }) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        obscureText: showSenha != null ? !showSenha : false,
        style: TextStyle(fontFamily: 'lato', fontSize: 13, color: inputColor ?? Colors.black),
        keyboardType: textInputType ?? TextInputType.name,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        validator: validator,
        enabled: enable,
        inputFormatters: textInputFormatter != null ? [textInputFormatter] : null,
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor ??  Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: paddingHeight ?? 10.0, horizontal: 25),
          border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent, width: 0.5), borderRadius: BorderRadius.circular(radius ?? 40)),
          enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent, strokeAlign: 5), borderRadius: BorderRadius.circular(radius ?? 40)),
          disabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(radius ?? 40)),
          focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent, strokeAlign: 5), borderRadius: BorderRadius.circular(radius ?? 40)),
          focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(radius ?? 40)),
          errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(radius ?? 40)),
          suffixIcon: suffixIcon,
          hintText: hint,
          hintStyle: const TextStyle(fontFamily: 'lato', fontSize: 13, color: Colors.grey),
        ),
      ),
    ),
  );
}

Widget getPinCodeFormField({
  required TextEditingController controller,
  int? length,
  PinCodeFieldShape? shape,
  BorderRadius? radius,
  double? height,
  double? width,
  Color? activeFillColor,
  Color? errorBorderColor,
  Color? selectedColor,
  Color? activeColor,
  Color? inactiveColor,
  Color? inactiveFillColor,
  Color? selectedFillColor,
  String? Function(String?)? validator,
}) {
  FilteringTextInputFormatter formatter = FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));

  return Builder(
    builder: (context) {
      return PinCodeTextField(
        appContext: context,
        controller: controller,
        length: length ?? 6,
        mainAxisAlignment: MainAxisAlignment.center,
        errorTextDirection: TextDirection.rtl,
        pinTheme: PinTheme(
          shape: shape ?? PinCodeFieldShape.box,
          borderRadius: radius ?? BorderRadius.circular(10),
          fieldHeight: height ?? 45,
          fieldWidth: width ?? 45,
          activeFillColor: activeFillColor,
          errorBorderColor: errorBorderColor,
          selectedColor: selectedColor,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          inactiveFillColor: inactiveFillColor,
          selectedFillColor: selectedFillColor,
          fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 8),
        ),
        autoDisposeControllers: false,
        cursorColor: Colors.black,
        animationType: AnimationType.fade,
        animationDuration: const Duration(microseconds: 300),
        enableActiveFill: true,
        keyboardType: TextInputType.number,
        inputFormatters: [formatter],
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (String value) {},
        validator: validator,
      );
    },
  );
}
