import 'package:flutter/material.dart';

class AppColors {
  // 背景色
  static const Color lightBackground = Color(0xFFF5F5F0); // 浅米色背景
  static const Color darkBackground = Color(0xFF1A1C1E);

  // 卡片背景色
  static const Color lightSurfaceColor = Colors.white;
  static const Color darkSurfaceColor = Color(0xFF2E3133);

  // 分组标题颜色
  static const Color lightGroupTitleColor = Color(0xFF666666);
  static const Color darkGroupTitleColor = Color(0xFF999999);

  // 获取背景色
  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBackground
        : lightBackground;
  }

  // 获取卡片背景色
  static Color getSurfaceColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkSurfaceColor
        : lightSurfaceColor;
  }

  // 获取分组标题颜色
  static Color getGroupTitleColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkGroupTitleColor
        : lightGroupTitleColor;
  }

  // 获取主要文本颜色
  static Color getTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? withAlpha(Colors.white, 0.9)
        : withAlpha(Colors.black, 0.9);
  }

  // 获取次要文本颜色
  static Color getSecondaryTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? withAlpha(Colors.white, 0.6)
        : withAlpha(Colors.black, 0.6);
  }

  // 获取提示文本颜色
  static Color getHintTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? withAlpha(Colors.white, 0.4)
        : withAlpha(Colors.black, 0.4);
  }

  // 处理透明度
  static Color withAlpha(Color color, double opacity) {
    return color.withAlpha((opacity * 255).round());
  }

  // 获取分割线颜色
  static Color getDividerColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? withAlpha(Colors.white, 0.1)
        : withAlpha(Colors.black, 0.1);
  }

  // 获取带透明度的文本颜色
  static Color getTextColorWithOpacity(BuildContext context, double opacity) {
    return withAlpha(getTextColor(context), opacity);
  }

  // 预定义的透明度级别
  static const double highEmphasis = 0.8;
  static const double mediumEmphasis = 0.6;
  static const double lowEmphasis = 0.4;
  static const double ultraLowEmphasis = 0.2;

  // 获取高强调文本颜色
  static Color getHighEmphasisTextColor(BuildContext context) {
    return getTextColorWithOpacity(context, highEmphasis);
  }

  // 获取中等强调文本颜色
  static Color getMediumEmphasisTextColor(BuildContext context) {
    return getTextColorWithOpacity(context, mediumEmphasis);
  }

  // 获取低强调文本颜色
  static Color getLowEmphasisTextColor(BuildContext context) {
    return getTextColorWithOpacity(context, lowEmphasis);
  }

  // 获取超低强调文本颜色
  static Color getUltraLowEmphasisTextColor(BuildContext context) {
    return getTextColorWithOpacity(context, ultraLowEmphasis);
  }
}
