import 'package:flutter/material.dart';

class BfsiColors {
  BfsiColors._();
  // Every color name should be in camel case and it should start with lt or dt
  // (i.e lt Means - Light Theme and dt Means- Dark Theme)

  static const signInGrey = Color(0xFF8F8F92);
  static const ltAppPrimaryColor = Color(0xff243C50);
  static const ltBgWhiteColor = Color(0xFFFFFFFF);
  static const ltOnBgWhiteColor = Color(0xFFF2F2F1);
  static const ltWhiteBottomWidgetColor = Color(0xFFF3F2F2);
  static const ltAppErrorColor = Color(0xFFDA0063);
  static const ltAppRedColor = Colors.red;
  static const ltLightGrayColor = Color(0xFFE9ECEF);
  static const ltDarkGrayColor = Color(0xFF1A1A1A);
  static const ltGreenColor = Color(0xFF0CA789);
  static const ltYellowColor = Color(0xFFFAC710);
  static const ltColorTeal = Colors.teal;
  static const descriptionColor = Color(0xFF7A7878);
  static const ltGreenTickMarkColor = Color(0xFF8FD14F);
  static const ltBlackTitleSmall = Color(0xFF4C4C4D);
  static const ltBlackLableLarge = Color(0xff000000);
  static const ltOnSecondaryColor = Color(0xff11A49D);
  static const ltTableHeaderColor = Color(0XFF1B2559);
  static const disableRow = Color(0XFF8d92ac);
  static const menuBorderColor = Color(0xff4A6881);
  static Color ltLightGrayColorWithOpacity0_01 =
      const Color(0xFF808080).withOpacity(0.1);
  static Color ltLightGrayColorWithOpacity0_05 =
      const Color(0xFF808080).withOpacity(0.5);
  static Color buttonColor = const Color(0xFF7163FD);
  static Color clickHere = const Color(0xFF5DDCED);
  static Color errorColor = const Color(0xFFFE4141);
  static Color raiseRequestButtonColor = const Color(0xFFAC7C02);
  static Color dividerColor = const Color(0xFF8F8F92);

  static const LinearGradient appGradientColor = LinearGradient(
    colors: <Color>[Color(0xFF010101), Color(0xFF152D53)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient boxColor = LinearGradient(
    colors: <Color>[Color(0xFFFFFFFF), Color(0xFFD9D9D9)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
