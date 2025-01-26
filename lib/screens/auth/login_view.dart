import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_provider.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/social_icon_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends ConsumerStatefulWidget {
  final VoidCallback onToggleView;

  const LoginView({
    Key? key,
    required this.onToggleView,
  }) : super(key: key);

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  final _emailFieldKey = GlobalKey<CustomTextFieldState>();
  final _passwordFieldKey = GlobalKey<CustomTextFieldState>();

  void resetForm() {
    _emailController.clear();
    _passwordController.clear();
    _isPasswordVisible = false;
    _emailFieldKey.currentState?.reset();
    _passwordFieldKey.currentState?.reset();
    if (_formKey.currentState != null) {
      _formKey.currentState!.reset();
    }
    setState(() {});
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 0),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'welcome back we missed you',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  key: _emailFieldKey,
                  controller: _emailController,
                  hintText: '邮箱地址',
                  icon: Icons.email_outlined,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return '请输入邮箱地址';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(val)) {
                      return '请输入有效的邮箱地址';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  key: _passwordFieldKey,
                  controller: _passwordController,
                  hintText: '密码',
                  icon: Icons.lock_outline,
                  isPassword: true,
                  isPasswordVisible: _isPasswordVisible,
                  onPasswordVisibilityToggle: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  validator: (val) => val!.length < 6 ? '密码至少需要6个字符' : null,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white60,
                    ),
                    child: const Text('忘记密码？'),
                  ),
                ),
                const SizedBox(height: 0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          await ref.read(authProvider.notifier).login(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                          // 登录成功后清空表单
                          setState(() {
                            _emailController.clear();
                            _passwordController.clear();
                            _isPasswordVisible = false;
                            if (_formKey.currentState != null) {
                              _formKey.currentState!.reset();
                            }
                          });
                          // 登录成功后导航到首页
                          if (mounted) {
                            context.go('/');
                          }
                        } catch (e) {
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('登录失败: ${e.toString()}'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple.shade400,
                            Colors.pink.shade400,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: const Text(
                          '登录',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 1),
                TextButton(
                  onPressed: widget.onToggleView,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white60,
                  ),
                  child: const Text('没有账号？注册'),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/Rectangle3.svg',
                          width: 98,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/images/Rectangle4.svg',
                          width: 98,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialIconButton(
                          icon: FontAwesomeIcons.google,
                          onPressed: () {},
                        ),
                        const SizedBox(width: 16),
                        SocialIconButton(
                          icon: FontAwesomeIcons.apple,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
