import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/font_manager/font_manager.dart';
import 'package:flutter_ecommerce_app/core/style_manager/style_manager.dart';

class DialogUtils {
  static void showLoader(
      {required BuildContext context, required String message}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    style: mediumTextStyle(color: ColorManager.black,fontSize: FontSize.s18),
                  ),
                )
              ],
            ),
          );
        });
  }

  static void hideLoader(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
      {required BuildContext context,
      String title = '',
      required String message,
      String? posActionName,
      Function? posAction,
      String? cancelActionName,
      Function? cancelAction}) {
    List<Widget> actions = [];

    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posActionName)));
    }

    if (cancelActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            cancelAction?.call();
          },
          child: Text(cancelActionName)));
    }

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: regularTextStyle(color: ColorManager.black,fontSize: FontSize.s18),

            ),
            content: Text(
              message,
              style: regularTextStyle(color: ColorManager.black,fontSize: FontSize.s18),
            ),
            actions: actions,
          );
        });
  }
}
