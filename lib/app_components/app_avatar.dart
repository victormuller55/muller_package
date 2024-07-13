import 'package:flutter/material.dart';
import 'package:muller_package/app_components/app_container.dart';

Widget avatar(String url, {double? radius, bool? showBorder}) {
  return appContainer(
    radius: BorderRadius.circular(360),
    border: showBorder ?? true ? Border.all(color: Colors.white, width: 3) : null,
    child: CircleAvatar(
      radius: radius ?? 40,
      backgroundImage: const NetworkImage("https://thinksport.com.au/wp-content/uploads/2020/01/avatar-.jpg"),
      backgroundColor: Colors.white,
      foregroundImage: NetworkImage(url),
    ),
  );
}