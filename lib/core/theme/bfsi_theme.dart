import 'package:bfsi/core/consts/app_consts.dart';
import 'package:bfsi/core/consts/bfsi_colors.dart';
import 'package:flutter/material.dart';

class BfsiAppTheme {
  static ThemeData appTheme() {
    return ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: const ColorScheme(
        background: BfsiColors.ltBgWhiteColor,
        onBackground: BfsiColors.ltOnBgWhiteColor,
        brightness: Brightness.light,
        primary: BfsiColors.ltAppPrimaryColor,
        onPrimary: BfsiColors.ltAppPrimaryColor,
        secondary: BfsiColors.descriptionColor,
        onSecondary: BfsiColors.ltLightGrayColor,
        onSecondaryContainer: Colors.grey,
        error: BfsiColors.ltAppErrorColor,
        onError: BfsiColors.ltAppErrorColor,
        surface: BfsiColors.ltBlackLableLarge,
        onSurface: BfsiColors.ltBlackLableLarge,
      ),
      primaryColor: BfsiColors.ltAppPrimaryColor,
      bottomAppBarTheme: const BottomAppBarTheme(
        color: BfsiColors.ltLightGrayColor,
      ),
      popupMenuTheme: const PopupMenuThemeData(
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 4,
        position: PopupMenuPosition.under,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(Colors
            .grey), // Change the thumb color here// Set to true if you want the scrollbar to always be visible
      ),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: BfsiColors.ltAppPrimaryColor,
          fontSize: 20.0,
          fontFamily: AppConsts.poppinsFont,
          fontWeight: FontWeight.w400,
        ),
        backgroundColor: BfsiColors.ltBgWhiteColor,
        iconTheme: IconThemeData(
          color: BfsiColors.ltAppPrimaryColor,
        ),
      ),
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          color: BfsiColors.ltDarkGrayColor,
          fontSize: 18.0,
          fontFamily: AppConsts.poppinsFont,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: BfsiColors.ltLightGrayColor,
          fontSize: 13.0,
          fontFamily: AppConsts.poppinsFont,
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: BfsiColors.ltLightGrayColor,
          fontSize: 16.0,
          fontFamily: AppConsts.poppinsFont,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: BfsiColors.ltDarkGrayColor,
          fontSize: 18.0,
          fontFamily: AppConsts.poppinsFont,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          color: BfsiColors.ltDarkGrayColor,
          fontSize: 16.0,
          fontFamily: AppConsts.poppinsFont,
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          color: BfsiColors.ltAppPrimaryColor,
          fontFamily: AppConsts.poppinsFont,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: BfsiColors.ltBlackTitleSmall,
          fontFamily: AppConsts.poppinsFont,
          fontSize: 12.0,
        ),
        bodySmall: TextStyle(
          color: BfsiColors.ltBlackTitleSmall,
          fontFamily: AppConsts.poppinsFont,
          fontSize: 12.0,
        ),
        labelLarge: TextStyle(
          color: BfsiColors.ltAppPrimaryColor,
          fontSize: 14.0,
          fontFamily: AppConsts.poppinsFont,
          fontWeight: FontWeight.bold,
        ),
      ),
      unselectedWidgetColor: Colors.blue[400],
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: BfsiColors.ltAppPrimaryColor,
        ),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      dropdownMenuTheme: const DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          constraints: BoxConstraints(
            maxHeight: 38,
          ),
        ),
        textStyle: TextStyle(
          decorationColor: Colors.black,
          color: Colors.black,
          fontSize: 14.0,
          fontFamily: AppConsts.poppinsFont,
        ),
        menuStyle: MenuStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
        ),
      ),
    );
  }
}
