import 'package:flutter/material.dart';
import 'package:muller_package/app_components/app_container.dart';
import 'package:muller_package/app_components/app_sized_box.dart';
import 'package:muller_package/app_consts/app_spacing.dart';

void showModalEmpty(
    BuildContext context, {
      required Widget child,
      double initialHeight = 0.6, // percentual da tela
      double maxHeight = 0.95,
      double minHeight = 0.5,
      Color? backgroundColor,
      bool? isDismissible,
      void Function()? function,
    }) {
  showModalBottomSheet(
    context: context,
    isDismissible: isDismissible ?? true,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Padding(
        // empurra o modal inteiro para cima quando o teclado sobe
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: DraggableScrollableSheet(
          initialChildSize: initialHeight,
          minChildSize: minHeight,
          maxChildSize: maxHeight,
          expand: false,
          builder: (context, scrollController) {
            return appContainer(
              width: double.infinity,
              backgroundColor: backgroundColor ?? Colors.grey.shade200,
              radius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Column(
                children: [
                  // Handle para puxar
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 6,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController, // IMPORTANTE
                      child: child,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  ).then((_) => function?.call());
}
