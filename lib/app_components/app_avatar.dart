import 'package:flutter/material.dart';
import 'package:muller_package/app_components/app_container.dart';
import 'package:muller_package/app_consts/app_colors.dart';

Widget avatar(String url, {double? radius, bool? showBorder}) {
  return appContainer(
    radius: BorderRadius.circular(360),
    border: showBorder ?? true ? Border.all(color: Colors.white, width: 3) : null,
    child: CircleAvatar(
      radius: radius ?? 40,
      backgroundColor: AppColors.grey100,
      foregroundImage: NetworkImage(url),
      child: Icon(Icons.image_not_supported, size: radius != null ? radius - 30 :  40 - 3),
    ),
  );
}