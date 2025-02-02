import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme_utils.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF2196F3),
      brightness: Brightness.light,
    );

    final textTheme = GoogleFonts.notoSansTextTheme().copyWith(
      titleMedium: GoogleFonts.notoSans(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.notoSans(
        fontSize: 14,
      ),
      bodySmall: GoogleFonts.notoSans(
        fontSize: 12,
        color: Colors.black54,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: ThemeUtils.getBackgroundColor(false),
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: colorScheme.onSurface,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        actionsIconTheme: IconThemeData(color: colorScheme.onSurface),
        titleTextStyle: GoogleFonts.notoSans(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: colorScheme.onSurface,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: textTheme.titleMedium,
        subtitleTextStyle: textTheme.bodySmall,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF2196F3),
      brightness: Brightness.dark,
    );

    final textTheme =
        GoogleFonts.notoSansTextTheme(ThemeData.dark().textTheme).copyWith(
      titleMedium: GoogleFonts.notoSans(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.notoSans(
        fontSize: 14,
      ),
      bodySmall: GoogleFonts.notoSans(
        fontSize: 12,
        color: Colors.white54,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: ThemeUtils.getBackgroundColor(true),
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: colorScheme.onSurface,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        actionsIconTheme: IconThemeData(color: colorScheme.onSurface),
        titleTextStyle: GoogleFonts.notoSans(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: colorScheme.onSurface,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: textTheme.titleMedium,
        subtitleTextStyle: textTheme.bodySmall,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
