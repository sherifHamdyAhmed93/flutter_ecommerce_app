import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/font_manager/font_manager.dart';
import 'package:flutter_ecommerce_app/core/style_manager/style_manager.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_ecommerce_app/core/widgets/cart_product_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
      appBar: AppBar(title: Text('Cart',style: mediumTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s20),),),
      body: ListView.separated(
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
    )
    );
  }
}
