import 'package:flutter/material.dart';
import 'package:muller_package/app_components/app_container.dart';
import 'package:muller_package/app_components/app_sized_box.dart';
import 'package:muller_package/app_components/app_text.dart';
import 'package:muller_package/app_consts/app_colors.dart';
import 'package:muller_package/app_consts/app_context.dart';
import 'package:muller_package/app_consts/app_radius.dart';
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
  GlobalKey? key,
  Widget? fixedBottom,
  Widget? drawer,
  List<Widget>? actions,
}) {
  Widget leading = IconButton(
    onPressed: () => Navigator.pop(AppContext.context),
    icon: const Icon(Icons.arrow_back_outlined),
  );

  if (hideBackArrow ?? false) {
    leading = appSizedBox();
  }

  if (drawer != null) {
    leading = Builder(
      builder: (context) => IconButton(
        icon: CustomDrawerIcon(drawerIconColor: drawerIconColor), // Use o widget personalizado aqui
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    );
  }

  return Scaffold(
    extendBody: extendBody ?? false,
    backgroundColor: background ?? AppColors.grey200,
    drawer: drawer,
    key: key,
    appBar: showAppBar ?? true
        ? AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: drawerIconColor),
      backgroundColor: appBarBackground ?? AppColors.green,
      centerTitle: true,
      title: appText(title.toUpperCase(), bold: true, color: titleColor ?? AppColors.white),
      leading: leading,
      actions: actions != null ? [...actions, appSizedBox(width: AppSpacing.medium)] : null,
    )
        : null,
    body: body,
    bottomNavigationBar: fixedBottom,
  );
}

class CustomDrawerIcon extends StatelessWidget {
  final Color? drawerIconColor;

  const CustomDrawerIcon({super.key, this.drawerIconColor});

  @override
  Widget build(BuildContext context) {
    return appContainer(
      child: Icon(Icons.menu, color: drawerIconColor),
      radius: BorderRadius.circular(AppRadius.big),
    );
  }
}
