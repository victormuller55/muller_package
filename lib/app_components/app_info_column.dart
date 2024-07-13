import 'package:flutter/material.dart';
import 'package:muller_package/muller_package.dart';

Widget appInfoColumn({
  required String title,
  required String value,
  CrossAxisAlignment? crossAxisAlignment,
  Color? titleColor,
  Color? valueColor,
  double? titleSize,
  double? valueSize,
  double? width,
  bool? spacing,
  bool? ovewflowValue,
  bool? cortarTitle,
  bool? cortarValue,
}) {
  return Builder(builder: (context) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: [
          appText(title, bold: true, color: titleColor ?? AppColors.white, fontSize: titleSize ?? AppFontSizes.normal, cortado: cortarTitle),
          SizedBox(height: spacing ?? false ? 5 : 0),
          appText(value, color: valueColor ?? AppColors.white, overflow: ovewflowValue ?? true, fontSize: valueSize, cortado: cortarValue),
        ],
      ),
    );
  });
}