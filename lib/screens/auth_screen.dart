import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'dart:ui';
import '../providers/auth_provider.dart';
import 'auth/login_view.dart';
import 'auth/register_view.dart';
import 'package:flutter/rendering.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  bool _isPasswordVisible = false;
  String _passwordStrength = '';

  final _loginKey = GlobalKey<LoginViewState>();
  final _registerKey = GlobalKey<RegisterViewState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
    ));

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );

    if (isLogin) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void _toggleView() {
    setState(() {
      if (isLogin) {
        _loginKey.currentState?.resetForm();
      } else {
        _registerKey.currentState?.resetForm();
      }
      isLogin = !isLogin;
    });
  }

  void _checkPasswordStrength(String password) {
    if (password.isEmpty) {
      _passwordStrength = '';
    } else if (password.length < 6) {
      _passwordStrength = 'Weak';
    } else if (password.length < 8) {
      _passwordStrength = 'Medium';
    } else {
      _passwordStrength = 'Strong';
    }
    setState(() {});
  }

  void _handleAuth() {
    if (_formKey.currentState!.validate()) {
      if (isLogin) {
        ref.read(authProvider.notifier).login(
              userId: _usernameController.text,
              username: _usernameController.text,
            );
      } else {
        ref.read(authProvider.notifier).login(
              userId: _emailController.text,
              username: _emailController.text,
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF1A1A1A),
              Colors.purple.shade900,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Background Animation
            const BackgroundBubbles(),

            // Background Character - Login
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              top: isLogin ? 0 : -100,
              right: isLogin ? 0 : -50,
              child: AnimatedOpacity(
                opacity: isLogin ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: AnimatedScale(
                  scale: isLogin ? 1.0 : 0.5,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: Image.asset(
                    'assets/images/login_character.png',
                    height: 336,
                    errorBuilder: (context, error, stackTrace) {
                      print('Image load error: $error');
                      return Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 64,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Background Character - Register
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              top: 0,
              left: isLogin ? -80 : 80,
              child: AnimatedOpacity(
                opacity: isLogin ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: AnimatedScale(
                  scale: isLogin ? 0.8 : 1.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: Image.asset(
                    'assets/images/register_character.png',
                    height: 220,
                    errorBuilder: (context, error, stackTrace) {
                      print('Image load error: $error');
                      return Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.person_add,
                          size: 64,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Decorative Shapes - Register
            AnimatedPositioned(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
              top: isLogin ? 150 : 50,
              left: isLogin ? 180 : 20,
              child: AnimatedOpacity(
                opacity: isLogin ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOut,
                child: Image.asset(
                  'assets/images/front-shapes2.png',
                  width: 100,
                ),
              ),
            ),

            // Additional Decorative Shape
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              top: 200,
              left: 10,
              child: AnimatedOpacity(
                opacity: 1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: Image.asset(
                  'assets/images/front-shapes3.png',
                  width: 80,
                ),
              ),
            ),

            Positioned(
              top: 220,
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.15),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Stack(
                        children: [
                          // 登录视图
                          AnimatedOpacity(
                            opacity: isLogin ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 300),
                            child: IgnorePointer(
                              ignoring: !isLogin,
                              child: LoginView(
                                key: _loginKey,
                                onToggleView: _toggleView,
                              ),
                            ),
                          ),
                          // 注册视图
                          AnimatedOpacity(
                            opacity: isLogin ? 0.0 : 1.0,
                            duration: const Duration(milliseconds: 300),
                            child: IgnorePointer(
                              ignoring: isLogin,
                              child: RegisterView(
                                key: _registerKey,
                                onToggleView: _toggleView,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Decorative Shapes - Login (Top Layer)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 450),
              curve: Curves.easeInOut,
              top: isLogin ? 500 : -50,
              right: isLogin ? -15 : -25,
              child: AnimatedOpacity(
                opacity: isLogin ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 450),
                curve: const Interval(0.3, 0.7, curve: Curves.easeInOut),
                child: Image.asset(
                  'assets/images/front-shapes1.png',
                  width: 120,
                ),
              ),
            ),
            // Decorative Shapes - Login (Top Layer)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 450),
              curve: Curves.easeInOut,
              top: isLogin ? 500 : 230,
              right: isLogin ? -15 : -15,
              child: AnimatedOpacity(
                opacity: isLogin ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 450),
                curve: const Interval(0.3, 0.7, curve: Curves.easeInOut),
                child: Image.asset(
                  'assets/images/front-shapes1.png',
                  width: 120,
                ),
              ),
            ),
            // Decorative Shapes - Login (Left Top)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
              top: isLogin ? 230 : 100,
              right: isLogin ? -15 : 180,
              child: AnimatedOpacity(
                opacity: isLogin ? 1.0 : 0,
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOut,
                child: Image.asset(
                  'assets/images/front-shapes1.png',
                  width: 120,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final bool? isPasswordVisible;
  final Function()? onPasswordVisibilityToggle;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.isPasswordVisible,
    this.onPasswordVisibilityToggle,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword && !(isPasswordVisible ?? false),
        validator: validator,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(icon, color: Colors.white.withOpacity(0.5), size: 20),
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 44),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isPasswordVisible ?? false
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.white.withOpacity(0.5),
                    size: 20,
                  ),
                  onPressed: onPasswordVisibilityToggle,
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}

class SocialIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const SocialIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Center(
            child: FaIcon(
              icon,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class BackgroundBubbles extends StatefulWidget {
  const BackgroundBubbles({Key? key}) : super(key: key);

  @override
  State<BackgroundBubbles> createState() => _BackgroundBubblesState();
}

class _BackgroundBubblesState extends State<BackgroundBubbles>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Bubble> bubbles = List.generate(
    10,
    (index) => Bubble(
      position: Offset(
        Random().nextDouble() * 400,
        Random().nextDouble() * 800,
      ),
      size: Random().nextDouble() * 60 + 20,
      color: Colors.purple.withOpacity(0.3),
    ),
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        for (var bubble in bubbles) {
          bubble.position = Offset(
            bubble.position.dx,
            bubble.position.dy - (bubble.size / 100),
          );

          if (bubble.position.dy < -bubble.size) {
            bubble.position = Offset(
              Random().nextDouble() * 400,
              MediaQuery.of(context).size.height + bubble.size,
            );
          }
        }

        return CustomPaint(
          painter: BubblePainter(bubbles: bubbles),
          size: Size.infinite,
        );
      },
    );
  }
}

class Bubble {
  Offset position;
  double size;
  Color color;

  Bubble({
    required this.position,
    required this.size,
    required this.color,
  });
}

class BubblePainter extends CustomPainter {
  final List<Bubble> bubbles;

  BubblePainter({required this.bubbles});

  @override
  void paint(Canvas canvas, Size size) {
    for (var bubble in bubbles) {
      canvas.drawCircle(
        bubble.position,
        bubble.size,
        Paint()..color = bubble.color,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
