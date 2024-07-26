import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muller_package/muller_package.dart';

class AppScrollVertical extends StatelessWidget {
  final Widget child;
  final double? padding;
  final bool center;

  const AppScrollVertical({
    super.key,
    required this.child,
    this.padding,
    this.center = true,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: EdgeInsets.all(padding ?? AppSpacing.zero),
              child: IntrinsicHeight(
                child: center
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [child],
                      )
                    : child,
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget appScrollHorizontal({
  required Widget child,
  double? height,
  double? width,
}) {
  return SizedBox(
    height: height,
    width: width,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: child,
    ),
  );
}
