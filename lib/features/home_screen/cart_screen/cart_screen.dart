import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/font_manager/font_manager.dart';
import 'package:flutter_ecommerce_app/core/style_manager/style_manager.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_ecommerce_app/core/widgets/cart_product_widget.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_elevated_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
      appBar: AppBar(title: Text('Cart',style: mediumTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s20),),),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: AppSize.s15,);
                },
                shrinkWrap: true,
                padding: EdgeInsets.all(AppPadding.p12),
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CartProductWidget();
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Total price',style: mediumTextStyle(color: ColorManager.darkPrimaryColor.withOpacity(0.6),fontSize: FontSize.s18),),
                      SizedBox(width: AppSize.s8,),
                      Text('EGP 3,500',style: mediumTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s18),)
                    ],
                  ),
                  SizedBox(width: AppSize.s28,),
                  Expanded(
                    child: CustomElevatedButton(label: 'Check Out', onTap: (){},
                      backgroundColor: ColorManager.primaryColor,
                      labelTextStyle: mediumTextStyle(color: ColorManager.white,fontSize: FontSize.s20),
                      suffixIcon: Icon(Icons.arrow_right_alt,color: ColorManager.white,),
                      raduis: 20,
                    ),
                  ) ,
              
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
