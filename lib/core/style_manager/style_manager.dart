
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/font_manager/font_manager.dart';

TextStyle _getTextStyle(double fontSize , FontWeight  fontWeight, Color color){
   return TextStyle(
     fontSize: fontSize,
     fontFamily: FontFamily.family,
     fontWeight: fontWeight,
     color: color
   );
}

TextStyle lightTextStyle({double fontSize = FontSize.s12 , required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

TextStyle regularTextStyle({double fontSize = FontSize.s12 , required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

TextStyle mediumTextStyle({double fontSize = FontSize.s12 , required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

TextStyle semiBoldTextStyle({double fontSize = FontSize.s12 , required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

TextStyle boldTextStyle({double fontSize = FontSize.s12 , required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}