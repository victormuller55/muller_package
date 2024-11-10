import 'package:flutter/material.dart';

Widget appContainer({
  MainAxisAlignment? mainAxisAlignment,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? padding,
  double? height,
  double? width,
  double? opacity,
  Color? backgroundColor,
  BorderRadiusGeometry? radius,
  BoxBorder? border,
  BoxShape? shape,
  BoxShadow? shadow,
  Gradient? gradient,
  ImageProvider<Object>? image,
  Widget? child,
  String? bottomText,
  Color? bottomFontColor,
}) {
  return Container(
    margin: margin,
    padding: padding,
    height: height,
    width: width,
    decoration: BoxDecoration(
      image: image != null ? DecorationImage(image: image, fit: BoxFit.cover, opacity: opacity ?? 1) : null,
      color: backgroundColor,
      borderRadius: radius,
      border: border,
      gradient: gradient,
      boxShadow: shadow != null ? [shadow] : null,
    ),
    child: child,
  );
}