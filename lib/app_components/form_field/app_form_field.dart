import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muller_package/app_consts/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

OutlineInputBorder _border({double? radius, double? width, Color? color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: width ?? 0.5),
    borderRadius: BorderRadius.circular(radius ?? 40),
  );
}

TextStyle _style({Color? color}) {
  return TextStyle(fontFamily: 'lato', fontSize: 13, color: color ?? Colors.black);
}

class AppFormField {

  final TextEditingController _controller = TextEditingController();
  late final Widget formulario;

  AppFormField({
    required BuildContext context,
    required String hint,
    double? width,
    double? paddingHeight,
    double? radius,
    int? maxLines,
    bool? showContent,
    bool? enable,
    Color? inputColor,
    Color? backgroundColor,
    Widget? suffixIcon,
    Icon? icon,
    TextInputType? textInputType,
    TextInputFormatter? textInputFormatter,
    String? Function(String? value)? validator,
  }) {
    formulario = Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: width,
        child: TextFormField(
          enabled: enable,
          controller: _controller,
          validator: validator,
          maxLines: maxLines ?? 1,
          keyboardType: textInputType ?? TextInputType.name,
          obscureText: showContent != null ? !showContent : false,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          inputFormatters: textInputFormatter != null ? [textInputFormatter] : null,
          style: _style(color: inputColor),
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            prefixIcon: icon,
            suffix: suffixIcon,
            border: _border(),
            enabledBorder: _border(),
            disabledBorder: _border(),
            focusedBorder: _border(),
            errorBorder: _border(color: AppColors.red),
            focusedErrorBorder: _border(color: AppColors.red),
            fillColor: backgroundColor ?? Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: paddingHeight ?? 10.0, horizontal: 25),
            hintStyle:  _style(color: Colors.grey.shade400),
          ),
        ),
      ),
    );
  }

  String get value => _controller.text;

  TextEditingController get controller => _controller;
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
