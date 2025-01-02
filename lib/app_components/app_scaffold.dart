import 'package:flutter/material.dart';
import 'package:muller_package/app_components/app_bar.dart';
import 'package:muller_package/app_consts/app_colors.dart';

Widget scaffold({
  required String title,
  required Widget body,
  Color? background,
  Color? appBarColor,
  Color? titleColor,
  Color? drawerColor,
  bool? hideBackIcon,
  bool? extendBody,
  bool? showAppBar,
  GlobalKey? key,
  Widget? bottomNavigationBar,
  Widget? floatingActionButton,
  Widget? drawer,
  List<Widget>? actions,
}) {
  return Scaffold(
    appBar: showAppBar ?? true
        ? appBar(
            drawerIconColor: drawerColor,
            title: title,
            titleColor: titleColor,
            hideBackArrow: hideBackIcon,
            actions: actions,
            appBarBackground: appBarColor,
            drawer: drawer,
          )
        : null,
    extendBody: extendBody ?? false,
    backgroundColor: background ?? AppColors.grey200,
    drawer: drawer,
    key: key,
    body: body,
    bottomNavigationBar: bottomNavigationBar,
    floatingActionButton: floatingActionButton,
  );
}
