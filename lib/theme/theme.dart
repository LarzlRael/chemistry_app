import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorList = <Color>[
  Colors.purple,
  Colors.amber,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

const scaffoldBlackBackgroundColor = Color(0xff334B48);

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;
  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  })  : assert(selectedColor >= 0, 'Color index must be greater than 0'),
        assert(selectedColor < colorList.length,
            'Color index must be less than ${colorList.length}');
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        /* brightness: isDarkMode ? Brightness.dark : Brightness.light, */
        brightness: Brightness.dark,
        /* Text */
        textTheme: TextTheme(
          /*     titleLarge: GoogleFonts.montserratAlternates().copyWith(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: GoogleFonts.montserratAlternates().copyWith(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ), */
          titleSmall: GoogleFonts.montserratAlternates().copyWith(
            fontSize: 20,
          ),
        ),
        colorSchemeSeed: colorList[0],
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: GoogleFonts.montserratAlternates().copyWith(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      );
  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode,
  }) =>
      AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
}

class AppTheme2 {
  final bool isDarkmode;

  AppTheme2({required this.isDarkmode});

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color(0xff40E0D0),
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
        
      );
}
