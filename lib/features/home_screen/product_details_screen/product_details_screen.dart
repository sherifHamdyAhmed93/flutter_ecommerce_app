import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/assets_manager/assets_manager.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/font_manager/font_manager.dart';
import 'package:flutter_ecommerce_app/core/style_manager/style_manager.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_elevated_button.dart';
import 'package:flutter_ecommerce_app/core/widgets/product_slider_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int itemsCount = 1;

  final String desc = 'Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(elevation: 0,title: Text('Product Details',style: mediumTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s20),),),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductSliderWidget(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppSize.s8,horizontal: AppSize.s15),
                      child: Column(
                          children: [
                            _buildProductNameWithPrice(),
                            const SizedBox(height: AppSize.s8,),
                            _buildSoldWithRateAndIncrementAndDecrement(),
                            const SizedBox(height: AppSize.s8,),
                            _buildProductDesc()
                          ]
                      ),
                    ),
                  ],
                ),
                          ),
              ),
              _buildTotalPriceWithAddToCart()
            ]),
        )
    );
  }

  Widget _buildProductNameWithPrice(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Nike Air Jordon',maxLines: 2,style: mediumTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s18),),
        Text('EGP 1,200 ',style: mediumTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s18),),
      ],
    );
  }

  Widget _buildSoldWithRateAndIncrementAndDecrement(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(AppPadding.p8),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.primaryColor.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(30.r),
                  color: ColorManager.white,
                  ),
                  child: Text('3,230 Sold',style: mediumTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s14),)
            ),
            SizedBox(width: AppSize.s8,),
            _buildProductReview()
          ],
        ),
        _buildIncrementAndDecrementButton()
      ],
    );
  }

  Widget _buildProductReview(){
    return Row(
      children: [
        Image.asset(ImagesAssets.startIcon),
        SizedBox(width: AppSize.s4,),
        Text('4.8 (7,500)',style: regularTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s14),),
      ],
    );
  }

  Widget _buildIncrementAndDecrementButton(){
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.primaryColor,
          borderRadius: BorderRadius.circular(30.r)
      ),
      child: Row(
        children: [
          IconButton(onPressed: (){
            itemsCount--;
            setState(() {

            });
          }, icon: Icon(Icons.remove_circle_outline,color: ColorManager.white)),
          Text('$itemsCount',style: mediumTextStyle(color: ColorManager.white,fontSize: FontSize.s18),),
          IconButton(onPressed: (){
            itemsCount++;
            setState(() {

            });
          }, icon: Icon(Icons.add_circle_outline,color: ColorManager.white)),
        ],
      ),
    );
  }

  Widget _buildProductDesc(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description',maxLines: 2,style: mediumTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s18),),
        SizedBox(height: AppSize.s4,),
    ReadMoreText(desc,
      style: regularTextStyle(color: ColorManager.darkPrimaryColor.withOpacity(0.6),fontSize: FontSize.s14),
      trimMode: TrimMode.Line,
    trimLines: 3,
    colorClickableText: ColorManager.darkPrimaryColor,
    trimCollapsedText: ' Read more',
    trimExpandedText: ' Read less',
    moreStyle: regularTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s14),
    )
      ],
    );
  }


  Widget _buildTotalPriceWithAddToCart() {
return Container(
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
        child: CustomElevatedButton(label: 'Add to cart', onTap: (){},
          backgroundColor: ColorManager.primaryColor,
          labelTextStyle: mediumTextStyle(color: ColorManager.white,fontSize: FontSize.s20),
          prefixIcon: Icon(Icons.add_shopping_cart,color: ColorManager.white,),
          raduis: 20,
        ),
      ) ,

    ],
  ),
);
  }
}