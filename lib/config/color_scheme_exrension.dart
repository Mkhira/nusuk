import 'package:flutter/material.dart';
import 'package:nusuk/config/theme.dart';
import 'package:nusuk/utlis/context_extensions.dart';

extension CustomTheming on ColorScheme {
  InputDecoration otpInputDecoration(BuildContext context) => InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: context.propWidth(15),
        ),
        border: AppThemes.outlineInputBorder2(context),
        focusedBorder: AppThemes.outlineInputBorder2(context),
        enabledBorder: AppThemes.outlineInputBorder2(context),
      );

  // Custom Colors
  Color get light => Colors.white;
  Color get dark => Colors.black;
  Color get kPrimaryColor =>const Color(0xffB49164);
  Color get kPrimaryText => const Color(0xff49ABFF);
  Color get edit => Colors.orange;
  Color get dtRowBorder => Colors.grey[300] ?? Colors.grey;
  Color get kTextColor => const Color(0xFF757575);
  Color get compexDrawerCanvasColor => const Color(0xffe3e9f7);
  Color get complexDrawerBlueGrey => const Color(0xff1d1b31);
  Color get bgcolorWhite => const Color.fromRGBO(254, 254, 254, 1);
  Color get bgcolorfilter => const Color.fromRGBO(255, 255, 255, 1);
  Color get textColor => const Color.fromRGBO(4, 46, 102, 1);
  Color get bgcolorfilterSelected => const Color.fromRGBO(0, 148, 211, 1);
  Color get caption => const Color(0xff999999);
  Color get viewFileColor => const Color(0xff51BAB4);
  Color get documentBorder => const Color(0xffEBEBEB);
  Color get documentDate => const Color(0xff042E66);
  Color get byanButton => const Color(0xff4FBBBD);
  Color get acceptButton => const Color(0xff0996D4);
  Color get darkBG => const Color(0xff142544);
  Color get phoneHint => const Color(0xff999999);
  Color get tutorialTitleStart => const Color(0xff19579D);
  Color get tutorialTitleEnd => const Color(0xff1886C4);
  Color get tutorialsImageBG => const Color(0xff032447);
  Color get chatBG => const Color(0xffECEBEB);
  Color get bubble1 => const Color(0xff042E66);
  Color get bubble2 => const Color(0xffF7F9FD);
  Color get darkScaffoldBackgroundColor =>
      const Color.fromRGBO(14, 36, 69, 0.1);
  // Dimensions
  double get bigMargin => 20;
  double get defaultMargin => 16;
  double get mediumMargin => 12;
  double get smallMargin => 8;
  double get verySmallMargin => 4;
  double get highElevation => 16;
  double get mediumElevation => 8;
  double get lightElevation => 4;
  double get bigText => 22;
  double get defaultText => 18;
  double get mediumText => 16;
  double get smallText => 12;
  double get verySmallText => 8;
  double get listImageSize => 50;
  double get imageBorderRadius => 8;
  double get imageHeight => 450;
  BorderSide get dtBorderSide => BorderSide(
        color: dtRowBorder,
        width: 1.5,
      );
  BorderSide get dtBorderSideFake => const BorderSide(
        color: Colors.transparent,
        width: 1.5,
      );
}
