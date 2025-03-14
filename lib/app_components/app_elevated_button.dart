import 'package:flutter/material.dart';
import 'package:muller_package/app_components/app_text.dart';
import 'package:muller_package/app_consts/app_colors.dart';
import 'package:muller_package/app_consts/app_font_sizes.dart';

Widget appTextButton({
  required String text,
  double? padding,
  double? fontSize,
  Color? color,
  required void Function() onTap,
}) {
  return TextButton(
    onPressed:onTap,
    child: appText(
      text.toUpperCase(),
      fontSize: fontSize,
      color: color,
      letterSpacing: 1,
      bold: true,
    ),
  );
}

Widget appElevatedButton(
  Widget child, {
  required void Function() function,
  Color? backgroundColor,
  Color? borderColor,
  double? width,
  double? height,
  double? borderRadius,
}) {
  return ElevatedButton(
    onPressed: function,
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: backgroundColor ?? Colors.white,
      fixedSize: Size(width ?? 300, height ?? 40),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor ?? AppColors.transparent),
        borderRadius: BorderRadius.circular(borderRadius ?? 30.0),
      ),
    ),
    child: child,
  );
}

Widget appElevatedButtonText(
  String texto, {
  required void Function() function,
  Color? color,
  Color? borderColor,
  Color? textColor,
  double? width,
  double? fontSize,
  double? height,
  double? borderRadius,
}) {
  return appElevatedButton(
    appText(
      texto,
      color: textColor ?? const Color.fromRGBO(34, 111, 162, 1),
      bold: true,
      fontSize: fontSize ??AppFontSizes.small,
      letterSpacing: 1,
    ),
    function: function,
    backgroundColor: color,
    width: width,
    height: height,
    borderColor: borderColor,
    borderRadius: borderRadius,
  );
}
