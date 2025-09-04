import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muller_package/app_consts/app_colors.dart';

OutlineInputBorder _borderOutlined(
    {double? radius, double? width, Color? color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: width ?? 0.5),
    borderRadius: BorderRadius.circular(radius ?? 40),
  );
}

UnderlineInputBorder _borderUnderline(
    {double? radius, double? width, Color? color}) {
  return UnderlineInputBorder(
    borderSide: BorderSide(color: color ?? Colors.white, width: width ?? 1),
    borderRadius: BorderRadius.circular(radius ?? 40),
  );
}

TextStyle _style({Color? color, double? size}) {
  return TextStyle(
    fontFamily: 'lato',
    fontSize: size ?? 13,
    color: color ?? Colors.black,
    letterSpacing: 1,
  );
}

class AppFormField {

  final TextEditingController _controller = TextEditingController();

  late final Widget formulario;
  late final FocusNode _focusNode;

  AppFormField({
    required BuildContext context,
    required String hint,
    double? width,
    double? paddingHeight,
    double? radius,
    double? fontSize,
    int? maxLines,
    bool? showContent,
    bool? enable,
    bool? dense,
    bool? underline,
    Color? hintColor,
    Color? iconColor,
    Color? inputColor,
    Color? backgroundColor,
    Color? borderColor,
    Widget? suffixIcon,
    Icon? icon,
    TextInputType? textInputType,
    TextInputFormatter? textInputFormatter,
    String? Function(String? value)? validator,
    void Function()? onTap,
    ValueChanged<String>? onChange,
    bool showKeyboard = true, // Parâmetro adicionado
  }) {
    _focusNode = FocusNode();

    if (!showKeyboard) {
      _focusNode.canRequestFocus = false;
    }

    formulario = Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: width,
        child: TextFormField(
          enabled: enable,
          onTap: onTap,
          controller: _controller,
          validator: validator,
          maxLines: maxLines ?? 1,
          keyboardType: textInputType ?? TextInputType.name,
          obscureText: showContent != null ? !showContent : false,
          onChanged: onChange,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          inputFormatters:
          textInputFormatter != null ? [textInputFormatter] : null,
          style: _style(color: inputColor, size: fontSize),
          decoration: InputDecoration(
            hintText: hint,
            isDense: dense,
            filled: true,
            prefixIcon: icon,
            suffix: suffixIcon,
            prefixIconColor: iconColor,
            border: underline ?? false
                ? _borderUnderline(radius: radius, color: borderColor)
                : _borderOutlined(radius: radius, color: borderColor),
            enabledBorder: underline ?? false
                ? _borderUnderline(radius: radius, color: borderColor)
                : _borderOutlined(radius: radius, color: borderColor),
            disabledBorder: underline ?? false
                ? _borderUnderline(radius: radius, color: borderColor)
                : _borderOutlined(radius: radius, color: borderColor),
            focusedBorder: underline ?? false
                ? _borderUnderline(radius: radius, color: borderColor)
                : _borderOutlined(radius: radius, color: borderColor),
            errorBorder: underline ?? false
                ? _borderUnderline(radius: radius, color: AppColors.red)
                : _borderOutlined(color: AppColors.red, radius: radius),
            focusedErrorBorder: underline ?? false
                ? _borderUnderline(radius: radius, color: AppColors.red)
                : _borderOutlined(color: AppColors.red, radius: radius),
            fillColor: backgroundColor ?? Colors.white,
            contentPadding: EdgeInsets.symmetric(
                vertical: paddingHeight ?? 10.0, horizontal: 25),
            hintStyle: _style(color: hintColor ?? Colors.grey, size: fontSize),
          ),
          focusNode: _focusNode, // Aplicando o FocusNode
        ),
      ),
    );
  }

  // Getter para obter o valor
  String get value => _controller.text;

  TextEditingController get controller => _controller;
}
