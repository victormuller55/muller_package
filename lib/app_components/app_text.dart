import 'package:flutter/material.dart';

Widget appText(
    String text, {
      Color? color,
      double? fontSize,
      bool? overflow,
      bool? bold,
      int? maxLines,
      double? letterSpacing,
      String? fontFamily,
      TextAlign? textAlign,
      bool? cortado,
    }) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.start,
    maxLines: maxLines,
    style: TextStyle(
      color: color,
      fontSize: fontSize ?? 13,
      overflow: overflow == true ? TextOverflow.ellipsis : null,
      fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
      letterSpacing: letterSpacing,

      fontFamily: fontFamily ?? 'lato',
      decoration: cortado ?? false ? TextDecoration.lineThrough : null,
    ),
  );
}
