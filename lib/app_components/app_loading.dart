import 'package:flutter/material.dart';
import 'package:muller_package/muller_package.dart';

Widget appLoading({
  required Widget child,
  Color? color,
}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        child,
        appSizedBox(height: 30),
        appText("Carregando...", bold: true, color: color),
      ],
    ),
  );
}

Widget appLoadingAnimation({
  required String animation,
  Color? color,
}) {
  return appLoading(
    child: appAnimation(animation, width: 200, height: 200),
    color: color,
  );
}
