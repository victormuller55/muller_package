import 'package:flutter/material.dart';
import 'package:muller_package/app_components/app_sized_box.dart';
import 'package:muller_package/app_components/app_text.dart';
import 'package:muller_package/app_consts/app_colors.dart';
import 'package:muller_package/app_consts/app_context.dart';
import 'package:muller_package/app_consts/app_icons.dart';
import 'package:muller_package/app_consts/app_spacing.dart';
import 'package:muller_package/app_consts/app_strings.dart';

SnackBar appSnackBar({
  required IconData icon,
  required Color background,
  required String mensagem,
  Color? color,
}) {
  return SnackBar(
    duration: const Duration(seconds: 3),
    backgroundColor: background,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    content: Row(
      children: [
        Icon(icon, color: color ?? AppColors.white),
        appSizedBox(width: AppSpacing.normal),
        Expanded(
          child: appText(mensagem, color: color ?? AppColors.white),
        )
      ],
    ),
  );
}

void showSnackbarError({String? message}) {
  ScaffoldMessenger.of(AppContext.context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      appSnackBar(
        icon: AppIcons.error,
        mensagem: message ?? AppStrings.ocorreuUmErro,
        background: AppColors.red,
      ),
    );
}

void showSnackbarWarning({required String message}) {
  ScaffoldMessenger.of(AppContext.context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      appSnackBar(
        icon: AppIcons.warning,
        mensagem: message,
        background: AppColors.orange,
      ),
    );
}

void showSnackbarSuccess({required String message}) {
  ScaffoldMessenger.of(AppContext.context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      appSnackBar(
        icon: AppIcons.check,
        mensagem: message,
        background: AppColors.green,
      ),
    );
}
