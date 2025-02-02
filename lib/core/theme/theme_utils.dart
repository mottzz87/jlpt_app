import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension ColorX on Color {
  Color withOpacityValue(double opacity) {
    return Color.fromARGB(
      (opacity * 255).round(),
      red,
      green,
      blue,
    );
  }
}

class ThemeUtils {
  static Color getBackgroundColor(bool isDark) {
    return isDark ? const Color(0xFF1A1C1E) : const Color(0xFFEEF1E1);
  }

  static Color getSurfaceColor(bool isDark) {
    return isDark ? const Color(0xFF2E3133) : const Color(0xFFFAFAFA);
  }

  static Color getTextColor(bool isDark) {
    return isDark ? Colors.white : Colors.black;
  }

  static SystemUiOverlayStyle getSystemUiStyle(bool isDark) {
    return isDark
        ? const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Color(0xFF1c1917),
            systemNavigationBarIconBrightness: Brightness.light,
          )
        : const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Color(0xFFFFFBF5),
            systemNavigationBarIconBrightness: Brightness.dark,
          );
  }

  static TextStyle getTextStyle({
    required bool isDark,
    double opacity = 0.8,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w500,
    Color? color,
  }) {
    final textColor = color ?? getTextColor(isDark);
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: textColor.withOpacityValue(opacity),
    );
  }

  static BoxDecoration getContainerDecoration({
    required bool isDark,
    double borderRadius = 16,
  }) {
    return BoxDecoration(
      color: getSurfaceColor(isDark),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  static Widget getDivider(
    bool isDark, {
    double opacity = 0.1,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 16),
  }) {
    return Padding(
      padding: padding,
      child: Divider(
        height: 0.5,
        thickness: 0.5,
        color: getTextColor(isDark).withOpacityValue(opacity),
      ),
    );
  }

  static Color withOpacity(Color color, double opacity) {
    return color.withOpacityValue(opacity);
  }
}
