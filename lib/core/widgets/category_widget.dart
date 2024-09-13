import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/font_manager/font_manager.dart';
import 'package:flutter_ecommerce_app/core/style_manager/style_manager.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_ecommerce_app/core/widgets/network_image_widget.dart';
import 'package:flutter_ecommerce_app/features/home_screen/home_tab/domain/entities/category_or_brand_response_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key,required this.item});

  CategoryOrBrandEntity item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NetworkImageWidget(imageUrl: item.image, height: 100.h, width: 100.w),
        const SizedBox(height: AppSize.s8,),
        Expanded(child: Text(item.name ?? '',maxLines: 2,overflow: TextOverflow.ellipsis,style: regularTextStyle(color: ColorManager.black,fontSize: FontSize.s12),textAlign: TextAlign.center,))
      ],
    );
  }
}
