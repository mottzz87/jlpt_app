import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:email_validator/email_validator.dart';
import '../../providers/auth_provider.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/social_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterView extends ConsumerStatefulWidget {
  final VoidCallback onToggleView;

  const RegisterView({
    Key? key,
    required this.onToggleView,
  }) : super(key: key);

  @override
  RegisterViewState createState() => RegisterViewState();
}

class RegisterViewState extends ConsumerState<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  final _emailFieldKey = GlobalKey<CustomTextFieldState>();
  final _passwordFieldKey = GlobalKey<CustomTextFieldState>();
  final _confirmPasswordFieldKey = GlobalKey<CustomTextFieldState>();

  void resetForm() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    _isPasswordVisible = false;
    _isConfirmPasswordVisible = false;
    _emailFieldKey.currentState?.reset();
    _passwordFieldKey.currentState?.reset();
    _confirmPasswordFieldKey.currentState?.reset();
    if (_formKey.currentState != null) {
      _formKey.currentState!.reset();
    }
    setState(() {});
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateConfirmPassword(String? value) {
    if (value != _passwordController.text) {
      return '两次输入的密码不一致';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 2),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '创建账号',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '开始你的学习之旅',
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
                  showPasswordStrength: true,
                  isPasswordVisible: _isPasswordVisible,
                  onPasswordVisibilityToggle: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  validator: (val) => val!.length < 8 ? '密码至少需要8个字符' : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  key: _confirmPasswordFieldKey,
                  controller: _confirmPasswordController,
                  hintText: '确认密码',
                  icon: Icons.lock_outline,
                  isPassword: true,
                  showPasswordStrength: false,
                  isPasswordVisible: _isConfirmPasswordVisible,
                  onPasswordVisibilityToggle: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                  validator: _validateConfirmPassword,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ref.read(authProvider.notifier).login(
                              userId: _emailController.text,
                              username: _emailController.text,
                            );
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
                          '注册',
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
                  child: const Text('已有账号？登录'),
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
