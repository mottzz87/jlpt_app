import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_links/app_links.dart';
import 'dart:ui';
import '../screens/home_screen.dart';
import '../screens/paper_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/auth_screen.dart';
import '../providers/auth_provider.dart';
import 'package:flutter/rendering.dart';

final _appLinks = AppLinks();

final router = GoRouter(
  initialLocation: '/auth',
  redirect: (BuildContext context, GoRouterState state) {
    final isLoggedIn = ProviderScope.containerOf(context)
        .read(authProvider.notifier)
        .isAuthenticated;

    // 如果未登录，除了 /auth 页面外，其他所有页面都重定向到登录页面
    if (!isLoggedIn && state.matchedLocation != '/auth') {
      return '/auth';
    }

    // 如果已登录且在登录页面，重定向到首页
    if (isLoggedIn && state.matchedLocation == '/auth') {
      return '/';
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'paper/:id',
              builder: (context, state) {
                final id = int.parse(state.pathParameters['id']!);
                return PaperScreen(paperId: id);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
);

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      extendBody: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).padding.bottom + 16,
        ),
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            final velocity = details.primaryVelocity ?? 0;
            final currentIndex = _calculateSelectedIndex(context);

            if (velocity < -500 && currentIndex < 2) {
              // 向左滑动，切换到下一个页面
              switch (currentIndex) {
                case 0:
                  context.go('/profile');
                  break;
                case 1:
                  context.go('/settings');
                  break;
              }
            } else if (velocity > 500 && currentIndex > 0) {
              // 向右滑动，切换到上一个页面
              switch (currentIndex) {
                case 1:
                  context.go('/');
                  break;
                case 2:
                  context.go('/profile');
                  break;
              }
            }
          },
          child: Container(
            width: 200,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(
                  context,
                  Icons.home_outlined,
                  Icons.home_rounded,
                  0,
                  _calculateSelectedIndex(context),
                  () => context.go('/'),
                  const Color(0xFFFAAD14),
                ),
                _buildNavItem(
                  context,
                  Icons.person_outline_rounded,
                  Icons.person_rounded,
                  1,
                  _calculateSelectedIndex(context),
                  () => context.go('/profile'),
                  const Color(0xFFFAAD14),
                ),
                _buildNavItem(
                  context,
                  Icons.settings_outlined,
                  Icons.settings_rounded,
                  2,
                  _calculateSelectedIndex(context),
                  () => context.go('/settings'),
                  const Color(0xFFFAAD14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    IconData selectedIcon,
    int index,
    int selectedIndex,
    VoidCallback onTap,
    Color accentColor,
  ) {
    final isSelected = index == selectedIndex;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 背景动画
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutBack,
              width: isSelected ? 40 : 32,
              height: isSelected ? 32 : 32,
              decoration: BoxDecoration(
                color: accentColor.withOpacity(isSelected ? 0.01 : 0),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withOpacity(isSelected ? 0.2 : 0),
                    blurRadius: 8,
                    spreadRadius: -2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            // 阴影动画
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutCubic,
              tween: Tween<double>(
                begin: 0,
                end: isSelected ? 1.0 : 0.0,
              ),
              builder: (context, value, child) {
                return Container(
                  width: 40,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: RadialGradient(
                      center: Alignment.center,
                      radius: 0.8,
                      colors: [
                        accentColor.withOpacity(0.2 * value),
                        accentColor.withOpacity(0),
                      ],
                      stops: const [0.5, 1.0],
                    ),
                  ),
                );
              },
            ),
            // 图标动画
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutCubic,
              tween: Tween<double>(
                begin: 0,
                end: isSelected ? 1.0 : 0.0,
              ),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, value * -2),
                  child: Transform.rotate(
                    angle: value * 0.05,
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 200),
                      scale: 0.85 + (value * 0.15),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: 0.5 + (value * 0.5),
                        child: Icon(
                          isSelected ? selectedIcon : icon,
                          size: 24,
                          color: isSelected
                              ? accentColor
                              : Colors.black.withOpacity(0.65),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/')) {
      if (location == '/') return 0;
      if (location.startsWith('/profile')) return 1;
      if (location.startsWith('/settings')) return 2;
    }
    return 0;
  }
}
