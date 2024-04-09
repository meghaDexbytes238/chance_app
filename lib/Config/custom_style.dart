import 'dart:ui';

import '../config/app_color.dart';

class AppStyle{
  static TextStyle buttonTextStyle1(
      {Color? texColor,
        double? fontSize,
        fontFamily,
        fontWeight,
        bool isItalic = false}) =>
      TextStyle(
          color: texColor ?? AppColor.redColor,
          fontSize: fontSize ?? 16,
          fontFamily: fontFamily,
          fontWeight: fontWeight ?? fontWeight.bold700,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal);
}


AppStyle appStyles = AppStyle();