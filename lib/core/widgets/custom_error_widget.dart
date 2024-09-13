import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/font_manager/font_manager.dart';
import 'package:flutter_ecommerce_app/core/style_manager/style_manager.dart';

class TryAgainWidget extends StatelessWidget {
  TryAgainWidget({super.key,required this.errorMessage,required this.onError});

  String errorMessage;
  Function onError;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMessage,textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.primaryColor,
                foregroundColor: ColorManager.white
              ),
              onPressed: () {
                onError.call();
              },
              child: Text('tryAgain',style: mediumTextStyle(color: ColorManager.white,fontSize: FontSize.s14),),
            ),
          ],
        ),
      ),
    );
  }
}
