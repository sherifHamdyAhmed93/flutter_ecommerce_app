import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_ecommerce_app/core/widgets/favorite_button_widget.dart';
import 'package:flutter_ecommerce_app/core/widgets/network_image_widget.dart';
import 'package:flutter_ecommerce_app/features/home_screen/products_tab/domain/entities/productsResponseEntity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSliderWidget extends StatefulWidget {
  ProductSliderWidget({super.key,required this.product});

  ProductEntity product;

  @override
  State<ProductSliderWidget> createState() => _ProductSliderWidgetState();
}

class _ProductSliderWidgetState extends State<ProductSliderWidget> {
  int _current = 0;

  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
      CarouselSlider.builder(
          itemCount: widget.product.images?.length,
          carouselController: _controller,
          itemBuilder: (context, itemIndex, pageViewIndex) {
            return Container(
              margin: EdgeInsets.all(AppSize.s15),
              child: NetworkImageWidget(imageUrl: widget.product.images![itemIndex],width:double.infinity ,height: 300.h,radius: 10,),
            );
          },
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
            height: 300.h,
            reverse: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            // aspectRatio: 2/1,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
          )),
          Positioned(top: 5,right: 5,child:FavoriteButton(product:widget.product),),
      Positioned(
        bottom: 20.h,
        left: MediaQuery.of(context).size.width/3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.product.images!.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: _current == entry.key ? 30 : 8,
                height: AppSize.s8.h,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.primaryColor),
                    borderRadius: BorderRadius.circular(_current == entry.key ? 8 : 8),
                    color: _current == entry.key
                        ? ColorManager.primaryColor
                        : ColorManager.white
                )
              ),
            );
          }).toList(),
        ),
      ),
    ]);
  }
}
