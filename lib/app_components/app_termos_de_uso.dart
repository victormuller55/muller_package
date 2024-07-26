import 'package:flutter/material.dart';
import 'package:muller_package/muller_package.dart';

Widget appListTileCheckbox(String text) {
  bool check = false;

  return StatefulBuilder(
    builder: (context, setState) {
      return CheckboxListTile(
        title: appText(text, color: AppColors.white),
        value: check,
        onChanged: (value) => setState(() => check = !check),
      );
    },
  );
}

Widget appTileTermosDeUso(String appName) {
  bool termosDeUso = false;

  return StatefulBuilder(
    builder: (context, setState) {
      return CheckboxListTile(
        title: appText("Concordo com os termos de uso e politica de privacidade do $appName.", color: AppColors.white),
        value: termosDeUso,
        onChanged: (value) => setState(() => termosDeUso = !termosDeUso),
      );
    },
  );
}
