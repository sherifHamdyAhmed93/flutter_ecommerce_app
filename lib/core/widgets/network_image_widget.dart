import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NetworkImageWidget extends StatelessWidget {
   NetworkImageWidget({super.key,required this.imageUrl,required this.height,required this.width,this.radius});
  String? imageUrl;
  double height;
  double width;
   double? radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      imageBuilder: (context, imageProvider) =>  ClipRRect(
          borderRadius: BorderRadius.circular((radius ?? height).r),
          clipBehavior: Clip.antiAlias,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          )
      ),
      placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
        color: ColorManager.primaryColor,
      )),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
