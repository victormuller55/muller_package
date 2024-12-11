import 'package:flutter/material.dart';
import 'package:muller_package/muller_package.dart';

AppBar appBar({
  required Color? drawerIconColor,
  required String title,
  Color? titleColor,
  Color? appBarBackground,
  bool? hideBackArrow,
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
        icon: CustomDrawerIcon(drawerIconColor: drawerIconColor),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    );
  }
  return AppBar(
    elevation: 0,
    iconTheme: IconThemeData(color: drawerIconColor),
    backgroundColor: appBarBackground ?? AppColors.grey,
    centerTitle: true,
    title: appText(title.toUpperCase(), bold: true, color: titleColor ?? AppColors.white,fontSize: AppFontSizes.normal),
    leading: leading,
    actions: actions != null ? [...actions, appSizedBox(width: AppSpacing.medium)] : null,
  );
}

class CustomDrawerIcon extends StatelessWidget {
  final Color? drawerIconColor;
  const CustomDrawerIcon({super.key, this.drawerIconColor});

  @override
  Widget build(BuildContext context) {
    return appContainer(
      child: Icon(Icons.menu, color: drawerIconColor),
      radius: BorderRadius.circular(1000),
    );
  }
}
