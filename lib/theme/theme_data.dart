import 'package:flutter/material.dart';
import 'package:todo_api_test/constant/appcolors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Appcolors.Colorweight,
    scaffoldBackgroundColor: Appcolors.Colorweight,
    cardColor: Appcolors.Colorgreen,
    appBarTheme: const AppBarTheme(
      color: Appcolors.Colorweight,
      titleTextStyle: TextStyle(
        color: Appcolors.Colorgreen,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Appcolors.Colorgrey,
      textColor: Appcolors.Colorblack,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Appcolors.Colorgreen,
      foregroundColor: Appcolors.Colorgrey,
    ),
    iconTheme: const IconThemeData(color: Appcolors.Colorgrey),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Appcolors.Colorgreen,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
      labelStyle: const TextStyle(color: Appcolors.Colorgrey),
      hintStyle: const TextStyle(color: Appcolors.Colorgrey),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Appcolors.Colorweight,
      selectedItemColor: Appcolors.Colorgrey,
      unselectedItemColor: Appcolors.Colorgrey,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
        fontSize: 12,
        color: Appcolors.Colorgrey,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 17,
        color: Appcolors.Colorgrey,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        color: Appcolors.Colorgrey,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Appcolors.Colorblack,
          ),
        ),
        foregroundColor: WidgetStatePropertyAll(Appcolors.Colorblack),
        backgroundColor: WidgetStatePropertyAll(Appcolors.Colorblack),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: Appcolors.Colorgreen,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: TextStyle(color: Appcolors.Colorblack),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Appcolors.Colorblack,
    scaffoldBackgroundColor: Appcolors.Colorblack,
    cardColor: Appcolors.Colorgreen,
    appBarTheme: const AppBarTheme(
      color: Appcolors.Colorblack,
      titleTextStyle: TextStyle(
        color: Appcolors.Colorlitered,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Appcolors.Colorweight,
      textColor: Appcolors.Colorweight,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Appcolors.Colorgreen,
      foregroundColor: Appcolors.Colorweight,
    ),
    iconTheme: const IconThemeData(color: Appcolors.Colorweight),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Appcolors.Colorgreen,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Appcolors.Colorgreen),
        borderRadius: BorderRadius.circular(8),
      ),
      labelStyle: const TextStyle(color: Appcolors.Colorweight),
      hintStyle: const TextStyle(color: Appcolors.Colorgrey),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Appcolors.Colorgrey,
      selectedItemColor: Appcolors.Colorgreen,
      unselectedItemColor: Appcolors.Colorgrey,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
        fontSize: 12,
        color: Appcolors.Colorgrey,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 17,
        color: Appcolors.Colorgrey,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        color: Appcolors.Colorgrey,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Appcolors.Colorweight,
          ),
        ),
        foregroundColor: WidgetStatePropertyAll(Appcolors.Colorweight),
        backgroundColor: WidgetStatePropertyAll(Appcolors.Colorlitered),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: Appcolors.Colorlitered,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: TextStyle(color: Appcolors.Colorweight),
    ),
  );
}
