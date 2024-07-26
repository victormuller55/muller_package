import 'package:flutter/material.dart';
import 'package:muller_package/app_components/app_container.dart';
import 'package:muller_package/app_components/app_sized_box.dart';
import 'package:muller_package/app_consts/app_spacing.dart';

void showModalEmpty(
  BuildContext context, {
  required Widget child,
  double? height,
  Color? backgroundColor,
  bool? isDismissible,
  void Function()? function,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isDismissible: isDismissible ?? true,
    isScrollControlled: true,
    builder: (context) {
      return appContainer(
        height: height ?? 500,
        width: MediaQuery.of(context).size.width,
        backgroundColor: backgroundColor ?? Colors.grey.shade200,
        radius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            appContainer(
              height: 7,
              width: 120,
              backgroundColor: Colors.grey,
              radius: BorderRadius.circular(20),
            ),
            appSizedBox(height: AppSpacing.normal),
            child,
          ],
        ),
      );
    },
  ).then((value) => function);
}
