import 'package:flutter/cupertino.dart';
import 'package:muller_package/app_consts/app_context.dart';

void open({required Widget screen, bool? closePrevious}) {
  if (closePrevious ?? false) {
    Navigator.pushReplacement(AppContext.context, CupertinoPageRoute(builder: (context) => screen));
  } else {
    Navigator.push(AppContext.context, CupertinoPageRoute(builder: (context) => screen));
  }
}
