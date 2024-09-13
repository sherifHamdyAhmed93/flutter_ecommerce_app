import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/assets_manager/assets_manager.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/font_manager/font_manager.dart';
import 'package:flutter_ecommerce_app/core/routes_manager/routes.dart';
import 'package:flutter_ecommerce_app/core/style_manager/style_manager.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_ecommerce_app/core/widgets/circle_button.dart';
import 'package:flutter_ecommerce_app/core/widgets/network_image_widget.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/domain/entities/productsResponseEntity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryProductWidget extends StatelessWidget {
  CategoryProductWidget({super.key,required this.product});

  ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(Routes.productRoute);
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        // height: 300.h,
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: ColorManager.primaryColor.withOpacity(0.3),width: 2)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch ,
          children: [
            Stack(
                children: [
                  NetworkImageWidget(imageUrl: product.imageCover,width:double.infinity ,height: 128.h,radius: 0,),
                  // Image.asset(ImagesAssets.tempProductIcon,fit: BoxFit.cover,width: double.infinity,),
                  Positioned(child: CircleButton(imageAsset: TabBarAssets.favoriteIcon,onTap: (){},backgroundColor: ColorManager.white,),top: 5,right: 5,)
                ]
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${product.title}',maxLines: 2,style: regularTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s14),),
                    SizedBox(height: AppSize.s4,),
                    Row(
                      children: [
                        Text('EGP ${product.price} ',style: regularTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s14),),
                        SizedBox(width: AppSize.s15,),
                        Text('2000 EGP',style: regularTextStyle(color: ColorManager.primaryColor.withOpacity(0.6),fontSize: FontSize.s12).copyWith(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: ColorManager.primaryColor.withOpacity(0.6)
                        ),),

                      ],
                    ),
                    SizedBox(height: AppSize.s4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [_buildProductReview(), CircleButton(icon: Icons.add_outlined,onTap: (){})]
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  Widget _buildProductReview(){
    return Row(
      children: [
        Text('Review (${product.ratingsAverage})',style: regularTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s12),),
        SizedBox(width: AppSize.s2,),
        Image.asset(ImagesAssets.startIcon),
      ],
    );
  }

  }
