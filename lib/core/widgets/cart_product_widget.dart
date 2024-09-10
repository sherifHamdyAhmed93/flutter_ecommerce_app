import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/assets_manager/assets_manager.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/font_manager/font_manager.dart';
import 'package:flutter_ecommerce_app/core/style_manager/style_manager.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_ecommerce_app/core/widgets/circle_button.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_elevated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartProductWidget extends StatefulWidget {
  CartProductWidget({super.key});

  @override
  State<CartProductWidget> createState() => _CartProductWidgetState();
}

class _CartProductWidgetState extends State<CartProductWidget> {
  int itemsCount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
        height: 140.h,
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: ColorManager.primaryColor.withOpacity(0.3),width: 1)
        ),
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: ColorManager.primaryColor.withOpacity(0.3),width: 1)
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(ImagesAssets.tempProductIcon,fit: BoxFit.cover,width: MediaQuery.of(context).size.width*0.3,height: double.infinity,)
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:  AppPadding.p8,horizontal: AppPadding.p8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Nike Air Jordon\nNike shoes flexible for wo..',maxLines: 2,style: regularTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s14),),
                        IconButton(onPressed: (){}, icon: Image.asset('assets/images/trash.png'))
                      ],
                    ),
                    // SizedBox(height: AppSize.s4,),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black
                          ),
                          height: AppSize.s15,
                          width: AppSize.s15,
                        ),
                        SizedBox(width: AppSize.s8,),
                        Text('Black color',style: regularTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s14))
                      ],
                    ),
                    // SizedBox(height: AppSize.s4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text('EGP 1,200 ',style: mediumTextStyle(color: ColorManager.darkPrimaryColor,fontSize: FontSize.s18),),
                            // SizedBox(width: AppSize.s2,),
                            // Text('2000 EGP',style: regularTextStyle(color: ColorManager.primaryColor.withOpacity(0.6),fontSize: FontSize.s12).copyWith(
                            //     decoration: TextDecoration.lineThrough,
                            //     decorationColor: ColorManager.primaryColor.withOpacity(0.6)
                            // ),),
                            // CustomElevatedButton(label: 'Add to cart', onTap: (){},backgroundColor: ColorManager.primaryColor,)
                          ],
                        ),
                        Container(
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
                        )
                      ],

                    ),
                    SizedBox(width: AppSize.s8,),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
