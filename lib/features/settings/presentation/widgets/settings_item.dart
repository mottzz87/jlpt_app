import 'package:flutter/material.dart';
import 'package:jlpt_app/core/theme/theme_utils.dart';
import 'package:jlpt_app/core/theme/app_colors.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final bool isFirst;
  final bool isLast;
  final IconData? icon;
  final Color? iconColor;
  final Widget? trailing;

  const SettingItem({
    super.key,
    required this.title,
    required this.onTap,
    this.isFirst = false,
    this.isLast = false,
    this.icon,
    this.subtitle,
    this.iconColor,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = ThemeUtils.getTextColor(isDark);

    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.vertical(
              top: isFirst ? const Radius.circular(16) : Radius.zero,
              bottom: isLast ? const Radius.circular(16) : Radius.zero,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 11,
              ).copyWith(
                top: isFirst ? 15 : 11,
                bottom: isLast ? 15 : 11,
              ),
              child: Row(
                children: [
                  if (icon != null) ...[
                    Icon(
                      icon,
                      color: iconColor ?? AppColors.withAlpha(textColor, 0.6),
                      size: 18,
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: ThemeUtils.getTextStyle(
                            isDark: isDark,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (subtitle != null) ...[
                          const SizedBox(height: 2),
                          Text(
                            subtitle ?? '',
                            style: ThemeUtils.getTextStyle(
                              isDark: isDark,
                              fontSize: 13,
                              opacity: 0.6,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (trailing != null)
                    trailing!
                  else
                    Icon(
                      Icons.chevron_right,
                      color: AppColors.withAlpha(textColor, 0.4),
                      size: 16,
                    ),
                ],
              ),
            ),
          ),
        ),
        if (!isLast)
          ThemeUtils.getDivider(
            isDark,
            padding: const EdgeInsets.only(left: 50, right: 22),
          ),
      ],
    );
  }
}
