import 'package:flutter/material.dart';
import 'package:muller_package/app_components/app_elevated_button.dart';
import 'package:muller_package/app_components/app_sized_box.dart';
import 'package:muller_package/app_components/app_text.dart';
import 'package:muller_package/app_consts/app_colors.dart';
import 'package:muller_package/app_consts/app_radius.dart';
import 'package:muller_package/app_consts/app_spacing.dart';
import 'package:muller_package/models/error_model.dart';

Widget appError(ErrorModel errorModel, {required void Function() function}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 80, height: 80, child: Image.asset("assets/images/error.png")),
        appSizedBox(height: AppSpacing.big),
        appText(
          errorModel.erro ?? "Ocorreu um erro",
          color: AppColors.grey700,
          bold: true,
          fontSize: 20,
          textAlign: TextAlign.center
        ),
        appSizedBox(height: AppSpacing.normal),
        appText(
          errorModel.mensagem ?? "Tente novamente mais tarde",
          color: AppColors.grey,
        ),
        appSizedBox(height: AppSpacing.medium),
        appElevatedButtonText(
          "Tentar novamente".toUpperCase(),
          function: function,
          width: 250,
          borderRadius: AppRadius.normal,
          textColor: AppColors.grey900,
        )
      ],
    ),
  );
}
