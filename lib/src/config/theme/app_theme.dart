import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const TextTheme _textTheme = TextTheme(
  displayLarge: TextStyle(fontSize: 57), // headline1
  displayMedium: TextStyle(fontSize: 45), // headline2
  displaySmall: TextStyle(fontSize: 36), // headline3
  headlineLarge: TextStyle(fontSize: 32),
  headlineMedium: TextStyle(fontSize: 28), // headline4
  headlineSmall: TextStyle(fontSize: 24), // headline5
  titleLarge: TextStyle(fontSize: 22), // headline6
  titleMedium: TextStyle(fontSize: 16), // subtitle1
  titleSmall: TextStyle(fontSize: 14), // subtitle2
  bodyLarge: TextStyle(fontSize: 16), // bodyText1
  bodyMedium: TextStyle(fontSize: 14), // bodyText2
  bodySmall: TextStyle(fontSize: 12, letterSpacing: 0.5), // caption
  labelLarge: TextStyle(fontSize: 14, letterSpacing: 1.25), // button
  labelMedium: TextStyle(fontSize: 12, letterSpacing: 0.5), // bho
  labelSmall: TextStyle(fontSize: 11, letterSpacing: 0.5), // overline
);

//final String? _fontFamily = GoogleFonts.audiowide().fontFamily; // nice like games
//final String? _fontFamily = GoogleFonts.bungee().fontFamily; //particular bold game style
//final String? _fontFamily = GoogleFonts.bungeeInline().fontFamily; // particular bold
//final String? _fontFamily = GoogleFonts.archivoBlack().fontFamily; // bold good
//final String? _fontFamily = GoogleFonts.inter().fontFamily; //Hmm
//final String? _fontFamily = GoogleFonts.karla().fontFamily; // good
//final String? _fontFamily = GoogleFonts.mulish().fontFamily; // good
//final String? _fontFamily = GoogleFonts.raleway().fontFamily; // ok
//final String? _fontFamily = GoogleFonts.lato().fontFamily; // no
final String? _fontFamily = GoogleFonts.poppins().fontFamily; // good
//final String? _fontFamily = GoogleFonts.roboto().fontFamily;
//final String? _fontFamily = GoogleFonts.notoSans().fontFamily;

abstract class AppTheme {
  final String name = "";

  static const FlexScheme scheme = FlexScheme.bigStone;

/*
  static const FlexSchemeData _xmScheme = FlexSchemeData(
    name: 'XManager theme',
    description: 'XManager theme, custom definition of all colors',
    light: FlexSchemeColor(
      primary: Color(0xFF00296B),
      primaryContainer: Color(0xFFA0C2ED),
      secondary: Color(0xFFD26900),
      secondaryContainer: Color(0xFFFFD270),
      tertiary: Color(0xFF5C5C95),
      tertiaryContainer: Color(0xFFC8DBF8),
    ),
    dark: FlexSchemeColor(
      primary: Color(0xFFB1CFF5),
      primaryContainer: Color(0xFF3873BA),
      secondary: Color(0xFFFFD270),
      secondaryContainer: Color(0xFFD26900),
      tertiary: Color(0xFFC9CBFC),
      tertiaryContainer: Color(0xFF535393),
    ),
  );*/

  static ThemeData get light => FlexThemeData.light(
        scheme: scheme,
        textTheme: _textTheme,
        fontFamily: _fontFamily,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface, // BAD hmmm

        blendLevel: 15,
        //appBarBackground: Colors.red,
        appBarStyle: FlexAppBarStyle.surface,
        appBarElevation: 2,
        //appBarOpacity: 1,

        visualDensity: VisualDensity.standard,
        subThemesData: const FlexSubThemesData(
          //defaultRadius: 8,
          blendOnLevel: 10,
          blendOnColors: false,
          //inputDecoratorFillColor: FlexInputBorderType,
          //inputDecoratorRadius: 10,
          //inputDecoratorFocusedBorderWidth: 3,
          //inputDecoratorSchemeColor: SchemeColor.primary,
          //inputDecoratorUnfocusedBorderIsColored: true,
          inputDecoratorBorderType: FlexInputBorderType.underline,
          sliderBaseSchemeColor: SchemeColor.onSecondaryContainer,

          elevatedButtonSecondarySchemeColor: SchemeColor.primary,
          elevatedButtonSchemeColor: SchemeColor.onPrimary,

          //elevatedButtonRadius: 2,

          //buttonMinSize: Size(200, 40),
          //elevatedButtonRadius: 5,
          //elevatedButtonElevation: 4,
          //elevatedButtonTextStyle:
        ),
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      );

  static ThemeData get dark => FlexThemeData.dark(
        scheme: scheme,
        fontFamily: _fontFamily,
        //fontFamily: GoogleFonts.notoSans().fontFamily,

        //surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces, // GOOD
        //surfaceMode: FlexSurfaceMode.level, // GOOD
        //surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold, // GOOD
        //surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold, // Boh

        //surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold, // GOOD
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold, // GOOD
        //surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces, // GOOD blendLevel: 16,

        blendLevel: 36,
        appBarElevation: 4.0,
        subThemesData: const FlexSubThemesData(
          defaultRadius: 8,
          blendOnLevel: 20,
          // Inpit
          inputDecoratorRadius: 0,
          inputDecoratorBorderType: FlexInputBorderType.underline,
          //inputDecoratorBorderWidth: 0.0,
          //inputDecoratorFocusedBorderWidth: 0.0,
          //inputDecoratorUnfocusedHasBorder: false,
          //inputDecoratorUnfocusedBorderIsColored: false,
          //inputDecoratorIsFilled: false,
          //inputDecoratorSchemeColor: SchemeColor.secondary,
        
          radioSchemeColor: SchemeColor.onSecondaryContainer,
          sliderBaseSchemeColor: SchemeColor.onSecondaryContainer,

          // Elevated Button
          elevatedButtonRadius: 5,
          elevatedButtonSchemeColor: SchemeColor.onSecondary,
          elevatedButtonSecondarySchemeColor: SchemeColor.secondary,

          // Outlined Button
          outlinedButtonRadius: 5,
          //outlinedButtonSchemeColor: SchemeColor.secondary,
          //outlinedButtonOutlineSchemeColor: SchemeColor.onSecondary,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      );
}
