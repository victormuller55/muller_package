import 'package:flutter/material.dart';
import 'package:muller_package/app_consts/app_colors.dart';

import 'app_text.dart';

Widget scaffold(
    {required String title,
    required Widget body,
    String? hero,
    Color? background,
    Color? appBarColor,
    Color? titleColor,
    Color? drawerColor,
    bool? hideBackIcon,
    bool? extendBody,
    bool? showAppBar,
    bool? centerTitle,
    GlobalKey? key,
    Widget? bottomNavigationBar,
    Widget? floatingActionButton,
    Widget? drawer,
    List<Widget>? actions,
    LinearGradient? appBarGradient, // 👈 gradiente na AppBar
    double? size}) {
  return Scaffold(
    appBar: showAppBar ?? true
        ? appBar(
            drawerIconColor: drawerColor,
            title: title,
            titleColor: titleColor,
            hideBackArrow: hideBackIcon,
            actions: actions,
            appBarBackground: appBarColor,
            centerTitle: centerTitle,
            hero: hero,
            gradient: appBarGradient,
            // 👈 repassa o gradiente
            size: size)
        : null,
    extendBody: extendBody ?? false,
    backgroundColor: background ?? AppColors.grey200,
    drawer: drawer,
    key: key,
    body: SafeArea(child: body),
    bottomNavigationBar: bottomNavigationBar,
    floatingActionButton: floatingActionButton,
  );
}

PreferredSizeWidget appBar(
    {required String title,
    Color? titleColor,
    Color? appBarBackground,
    Color? drawerIconColor,
    bool? hideBackArrow,
    bool? centerTitle,
    List<Widget>? actions,
    String? hero,
    LinearGradient? gradient,
    double? size}) {
  return PreferredSize(
    preferredSize: Size(double.infinity, size ?? 60),
    child: AppBar(
      centerTitle: centerTitle ?? true,
      automaticallyImplyLeading: !(hideBackArrow ?? false),
      backgroundColor: appBarBackground,
      foregroundColor: drawerIconColor,
      title: appText(
        title.toUpperCase(),
        color: titleColor ?? Colors.white,
        fontSize: 17,
        bold: true,
      ),
      actions: actions,
      flexibleSpace: gradient != null
          ? Container(decoration: BoxDecoration(gradient: gradient))
          : null,
    ),
  );
}
