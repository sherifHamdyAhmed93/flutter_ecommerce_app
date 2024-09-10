import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/color_manager/color_manager.dart';
import 'package:flutter_ecommerce_app/core/values_manager/values_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSliderWidget extends StatefulWidget {
  ProductSliderWidget({super.key});

  @override
  State<ProductSliderWidget> createState() => _ProductSliderWidgetState();
}

class _ProductSliderWidgetState extends State<ProductSliderWidget> {
  int _current = 0;

  final CarouselSliderController _controller = CarouselSliderController();

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
      CarouselSlider.builder(
          itemCount: imgList.length,
          carouselController: _controller,
          itemBuilder: (context, itemIndex, pageViewIndex) {
            return Container(
              margin: EdgeInsets.all(AppSize.s15),
              child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.network(
                    imgList[itemIndex],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )),
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
      Positioned(
        bottom: 20.h,
        left: MediaQuery.of(context).size.width/3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
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
