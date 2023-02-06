import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nusuk/utlis/context_extensions.dart';

export './color_scheme_exrension.dart';

class AppThemes {
  // Custom Colors
  // Size size = const Size(600, 1200);
  static Color get kPrimaryColor => Colors.indigo;
  static Color get kTextColor => const Color(0xFF757575);

  static OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 10,
  );

  static OutlineInputBorder outlineInputBorder2(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(context.propWidth(15)),
      borderSide: BorderSide(color: kTextColor),
    );
  }

  ThemeData light([Size size = const Size(600, 1200)]) {
    const double baseH1 = 0.0155;
    const double factor = 0.00225;

    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'somar',
      primaryColor: const Color(0xffB49164),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xff002447),
      ),
      selectedRowColor: const Color(0xff4FBBBD),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 2,
        iconTheme: const IconThemeData(color: Color(0xffB49164)),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        toolbarTextStyle: const TextTheme(
          headline6: TextStyle(
            color: Color(0XFF8B8B8B),
            fontSize: 18,
          ),
        ).bodyText2,
        titleTextStyle: const TextTheme(
          headline6: TextStyle(
            color: Color(0XFF8B8B8B),
            fontSize: 18,
          ),
        ).headline6,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: kTextColor,
          fontSize: size.shortestSide * baseH1,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          color: kTextColor,
          fontSize: (size.shortestSide * baseH1) - (factor * 1),
          fontWeight: FontWeight.bold,
        ),
        headline3: TextStyle(
          color: kTextColor,
          fontSize: (size.shortestSide * baseH1) - (factor * 2),
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          color: kTextColor,
          fontSize: (size.shortestSide * baseH1) - (factor * 3),
          fontWeight: FontWeight.bold,
        ),
        headline5: TextStyle(
          color: kTextColor,
          fontSize: (size.shortestSide * baseH1) - (factor * 4),
          fontWeight: FontWeight.bold,
        ),
        bodyText1: TextStyle(
          color: kTextColor,
          fontSize: (size.shortestSide * baseH1) - (factor * 5),
        ),
        bodyText2: TextStyle(
          color: kTextColor,
          fontSize: (size.shortestSide * baseH1) - (factor * 5.5),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        border: outlineInputBorder,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}

AppThemes appThemes = AppThemes();
