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

  static const FlexSchemeData _customSchemeColor = FlexSchemeData(
    name: 'XManager theme',
    description: 'XManager theme, custom definition of all colors',
    light: FlexSchemeColor(
      primary: Color(0xFF1A1D23),
      primaryContainer: Color(0xFFA0C2ED),
      secondary: Color(0xFFD26900),
      secondaryContainer: Color(0xFFFFD270),
      tertiary: Color(0xFF5C5C95),
      tertiaryContainer: Color(0xFFC8DBF8),
    ),
    dark: FlexSchemeColor(
      primary: Color.fromARGB(255, 97, 97, 97),
      primaryContainer: Color.fromARGB(255, 0, 0, 0),
      secondary: Color(0xFFAA3535),
      secondaryContainer: Color(0xFFD26900),
      tertiary: Color.fromARGB(255, 0, 4, 112),
      tertiaryContainer: Color.fromARGB(255, 0, 0, 115),
      appBarColor: Colors.red,
      error: Colors.red,
      errorContainer: Colors.white,
      swapOnMaterial3: true,
    ),
  );

  static ThemeData get light => FlexThemeData.light(
        scheme: scheme,
        textTheme: _textTheme,
        fontFamily: _fontFamily,
       
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold, // GOOD

        blendLevel: 36,
        appBarElevation: 4.0,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,

        subThemesData: const FlexSubThemesData(
          defaultRadius: 9,
          blendOnLevel: 20,
          // Input
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

          //appBarBackgroundSchemeColor: SchemeColor.surfaceVariant
        ),
      );

  static ThemeData get dark => FlexThemeData.dark(
        scheme: scheme,
        //usedColors: 5,
        //textTheme: _textTheme,
        fontFamily: _fontFamily,
        //surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold, // GOOD current
        surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
        blendLevel: 14,
        //blendLevel: 36,
        //appBarElevation: 4.0,

        subThemesData: const FlexSubThemesData(
          cardElevation: 2,
          defaultRadius: 10,
          //blendOnLevel: 20,
          // Input
          inputDecoratorRadius: 9,
          //inputDecoratorRadius: 5,
          //inputDecoratorBorderType: FlexInputBorderType.underline,
          //inputDecoratorBorderWidth: 0.0,
          //inputDecoratorFocusedBorderWidth: 0.0,
          //inputDecoratorUnfocusedHasBorder: false,
          //inputDecoratorUnfocusedBorderIsColored: false,
          //inputDecoratorIsFilled: false,
          //inputDecoratorSchemeColor: SchemeColor.secondary,
        
          radioSchemeColor: SchemeColor.onSecondaryContainer,
          sliderBaseSchemeColor: SchemeColor.onSecondaryContainer,

          // Elevated Button
          elevatedButtonRadius: 9,
          elevatedButtonSchemeColor: SchemeColor.onSecondary,
          elevatedButtonSecondarySchemeColor: SchemeColor.secondary,

          // Outlined Button
          outlinedButtonRadius: 9,
          //outlinedButtonSchemeColor: SchemeColor.secondary,
          //outlinedButtonOutlineSchemeColor: SchemeColor.onSecondary,

          // Filled Button
          filledButtonRadius: 9,
          //appBarBackgroundSchemeColor: SchemeColor.surfaceVariant
        ),
      
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      );
}
