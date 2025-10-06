import 'package:flutter/material.dart';

class MyThemeData {
  static Color primaryLightColor = const Color(0xFFFFB224);
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color blackColor = const Color(0xFF121312);
  static Color lightGreyColor = const Color(0xFF707070);
  static Color darkGreyColor = const Color(0xFF343534);
  static Color greyColor = const Color(0x81514F4F);
  static Color offWhiteColor = const Color(0xACFFFFFF);
  static Color yellowColor = const Color(0xFFF7B539);
  static Color containerColor = const Color(0xFF282A28);

  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: greyColor
    ),

      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: MyThemeData.whiteColor),
        titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: MyThemeData.whiteColor),
        titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: MyThemeData.whiteColor),
        bodyMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: whiteColor,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 13,
          color: whiteColor,
        )
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: MyThemeData.blackColor,
        selectedItemColor: MyThemeData.primaryLightColor,
        unselectedItemColor: MyThemeData.lightGreyColor,
      )
  );
}
