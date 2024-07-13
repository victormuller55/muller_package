import 'package:flutter/material.dart';
import 'package:muller_package/app_components/app_sized_box.dart';
import 'package:muller_package/app_components/app_text.dart';
import 'package:muller_package/app_consts/app_colors.dart';
import 'package:muller_package/app_consts/app_spacing.dart';

Widget scaffold({
  required Widget body,
  required String title,
  Color? background,
  Color? appBarBackground,
  Color? titleColor,
  Color? drawerIconColor,
  bool? hideBackArrow,
  bool? extendBody,
  bool? showAppBar,
  Widget? fixedBottom,
  Widget? drawer,
  List<Widget>? actions,
}) {
  return Scaffold(
    extendBody: extendBody ?? false,
    backgroundColor: background ?? AppColors.grey200,
    drawer: drawer,
    appBar: showAppBar ?? true ? AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: drawerIconColor ?? null),
      backgroundColor: appBarBackground ?? AppColors.green,
      centerTitle: true,
      title: appText(title.toUpperCase(), bold: true, color: titleColor ?? AppColors.white),
      leading: hideBackArrow ?? false ? appSizedBox() : null,
      actions: actions != null ? [...actions, appSizedBox(width: AppSpacing.medium)] : null,
    ) : null,
    body: body,
    bottomNavigationBar: fixedBottom,
  );
}
