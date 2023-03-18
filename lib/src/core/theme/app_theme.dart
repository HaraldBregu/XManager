import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  final String name = "";

  static const FlexScheme scheme = FlexScheme.bigStone;

  static ThemeData get light => FlexThemeData.light(
      scheme: scheme,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 9,
      appBarElevation: 2,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        blendOnColors: false,
        inputDecoratorBorderType: FlexInputBorderType.underline,
        sliderBaseSchemeColor: SchemeColor.onSecondaryContainer,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      fontFamily: GoogleFonts.notoSans().fontFamily,
  );

  static ThemeData get dark => FlexThemeData.dark(
      scheme: scheme,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 15,
      appBarElevation: 4.0,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        inputDecoratorBorderType: FlexInputBorderType.underline,
        radioSchemeColor: SchemeColor.onSecondaryContainer,
        sliderBaseSchemeColor: SchemeColor.onSecondaryContainer,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      fontFamily: GoogleFonts.notoSans().fontFamily,
  );

}
