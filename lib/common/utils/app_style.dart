import 'package:flutter/material.dart';

class AppStyle {
  static const Color pastelYellow = Color(0xFFFDFD94);
  static const Color pastelRed = Color(0xFFD26264);
  static const Color pastelBlue = Color(0xFF9BBEEB);
  static const Color pastelGreen = Color(0xFFBEE5AE);
  static const Color pastelPurple = Color(0xFF9A7FAC);
  static const Color pastelGrey = Color(0xFFB5B5AA);
  static const Color pastelWhite = Color(0xFFF9F9F7);

  static const Color pastelTeal60 = Color(0xFFCDF0E8);
  static const Color pastelTeal30 = Color(0xFF9ED2C4);
  static const Color pastelTeal10 = Color(0xFF54BAB7);

  static const Color brandColor = Color(0xFF5D869A);
  static const Color brandBlueColor = Color(0xFF37AEE0);
  static Color grayBrandColor = const Color(0xFFF8F8F6);
  static Color pastelOrange = const Color(0xFFFBBC05);
  static Color lightYellowbrandColor = const Color(0xFFFDB502);

  static const Color buttonGreenLightColor = Color(0xFFECFDF1);
  static const Color buttonRedLightColor = Color(0xFFFEF0F2);
  static const Color buttonGreyLightColor = Color(0xFFD3D3D1);

  static Color textColorPrimary = const Color(0xFFFFFB96);
  static Color textColorStyled = const Color(0xFF75788B);
  static Color textColorGreenStyled = const Color(0xFF73C74C);
  static Color textColorGrey = const Color(0xFF75788B);
  static Color textColorGreen = const Color(0xFF027A46);

  static TextStyle textTitle = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 18,
    color: Colors.black,
  );

  static TextStyle textTitleGreyItalic = TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 18,
    color: textColorGrey,
    fontStyle: FontStyle.italic,
  );

  static TextStyle textTitleGreyItalicBold = TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 18,
    color: textColorGrey,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textTitleGrey = TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 18,
    color: textColorGrey,
  );

  static TextStyle textTitleWhite = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 18,
    color: Colors.white,
  );

  static TextStyle textTitleYellow = TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 18,
    color: textColorPrimary,
  );

  static TextStyle textTitleBOLD = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textTitleBoldYellow = TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 18,
    color: textColorPrimary,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textTitleBOLDWhite = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textMoreBig = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 26,
    color: Colors.black,
  );

  static TextStyle textMoreBigBold = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle textMoreBigWhite = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 26,
    color: Colors.white,
  );

  static TextStyle textBig = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 20,
    color: Colors.black,
  );

  static TextStyle textBigBOLD = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textSubTitle = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 16,
    color: Colors.black,
  );

  static TextStyle textSubTitleStyled = TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 16,
    color: textColorStyled,
  );

  static TextStyle textSubTitleRed = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 16,
    color: Colors.red,
  );

  static TextStyle textSubTitleYellow = TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 16,
    color: textColorPrimary,
  );

  static TextStyle textSubTitleOrange = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 16,
    color: Colors.orange,
  );

  static TextStyle textSubTitleDekstop = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 18,
    color: Colors.black,
  );

  static TextStyle textSubTitleDekstopBold = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textSubTitleBlue = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 16,
    color: Colors.lightBlue,
  );

  static TextStyle textSubTitleBoldBlue = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 16,
    color: Colors.lightBlue,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textSubTitleWhite = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 16,
    color: Colors.white,
  );

  static TextStyle textSubTitleDekstopWhite = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 26,
    color: Colors.white,
  );

  static TextStyle textSubTitleDekstopBoldWhite = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 26,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textSubTitleBlueAccent = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 16,
    color: Colors.lightBlueAccent,
  );

  static TextStyle textSubTitleBOLD = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textSubTitleGrey = TextStyle(
    fontSize: 16,
    color: textColorGrey,
  );

  static TextStyle textSubTitleGreyBold = TextStyle(
    fontSize: 16,
    color: textColorGrey,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textSubTitleGreen = TextStyle(
    fontSize: 16,
    color: textColorGreen,
  );

  static TextStyle textSubTitleGreenStyled = TextStyle(
    fontSize: 16,
    color: textColorGreenStyled,
  );

  static TextStyle textSubTitleBOLDWhite = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textBody = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 14,
    color: Colors.black,
  );

  static TextStyle textBodyDekstop = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 18,
    color: Colors.black,
  );

  static TextStyle textBodyDekstopWhite = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 18,
    color: Colors.white,
  );

  static TextStyle textBodyWhite = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 14,
    color: Colors.white,
  );

  static TextStyle textBodyYellow = TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 14,
    color: textColorPrimary,
  );

  static TextStyle textBodyBOLD = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textBodyBOLDGrey = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 14,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textBodyRed = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 14,
    color: pastelRed,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textBodyGreen = TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 14,
    color: Colors.green[800],
    fontWeight: FontWeight.bold,
  );

  static TextStyle textBodyBOLDWhite = const TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textBodyGrey = const TextStyle(
    fontSize: 14,
    color: Colors.black45,
  );

  static TextStyle textBodyBlue = const TextStyle(
    overflow: TextOverflow.fade,
    fontSize: 14,
    color: Colors.blue,
  );

  static TextStyle textBodyGreyStyle = TextStyle(
    fontSize: 14,
    color: textColorGrey,
  );

  static TextStyle textBodyGreyBoldStyle = TextStyle(
    fontSize: 14,
    color: textColorGrey,
    fontWeight: FontWeight.bold,
  );

  static TextStyle smallText = const TextStyle(
    fontSize: 12,
    color: Colors.black,
  );

  static TextStyle smallTextGrey = const TextStyle(
    fontSize: 12,
    color: Colors.grey,
  );

  static TextStyle smallTextGreen = TextStyle(
    fontSize: 12,
    color: textColorGreen,
  );

  static TextStyle smallTextRed = const TextStyle(
    fontSize: 12,
    color: Colors.red,
  );

  static TextStyle smallTextOrange = const TextStyle(
    fontSize: 12,
    color: Colors.orange,
  );

  static TextStyle smallTextWhite = const TextStyle(
    fontSize: 12,
    color: Colors.white,
  );

  static TextStyle smallTextBold = const TextStyle(
    fontSize: 12,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle microText = const TextStyle(
    fontSize: 10,
    color: Colors.black,
  );

  static TextStyle microTextGrey = const TextStyle(
    fontSize: 10,
    color: Colors.grey,
  );

  static TextStyle microTextBlue = const TextStyle(
    fontSize: 10,
    color: Colors.blue,
  );

  static TextStyle microTextWhite = const TextStyle(
    fontSize: 10,
    color: Colors.white,
  );

  static TextStyle microTextRed = const TextStyle(
    fontSize: 10,
    color: Colors.red,
  );

  static TextStyle microTextBold = const TextStyle(
    fontSize: 10,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}

Color decreaseColorIntensity(Color color, double factor) {
  // Factor should be between 0 and 1
  assert(factor >= 0 && factor <= 1);

  int r = color.red;
  int g = color.green;
  int b = color.blue;

  // Decrease intensity
  r = (128 + (r - 128) * factor).toInt();
  g = (128 + (g - 128) * factor).toInt();
  b = (128 + (b - 128) * factor).toInt();

  return Color.fromARGB(color.alpha, r, g, b);
}
