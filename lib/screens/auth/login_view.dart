import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../providers/auth_provider.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/social_icon_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final l10n = AppLocalizations.of(context)!;
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
                Text(
                  l10n.loginWelcomeBack,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  l10n.loginWeMissedYou,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  key: _emailFieldKey,
                  controller: _emailController,
                  hintText: l10n.loginEmailHint,
                  icon: Icons.email_outlined,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return l10n.loginEmailRequired;
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(val)) {
                      return l10n.loginEmailInvalid;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  key: _passwordFieldKey,
                  controller: _passwordController,
                  hintText: l10n.loginPasswordHint,
                  icon: Icons.lock_outline,
                  isPassword: true,
                  isPasswordVisible: _isPasswordVisible,
                  onPasswordVisibilityToggle: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  validator: (val) =>
                      val!.length < 6 ? l10n.loginPasswordTooShort : null,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black.withOpacity(0.5),
                    ),
                    child: Text(l10n.loginForgotPassword),
                  ),
                ),
                const SizedBox(height: 0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      // 先触发所有字段的验证
                      // _emailFieldKey.currentState?.validate();
                      // _passwordFieldKey.currentState?.validate();

                      if (_formKey.currentState!.validate()) {
                        try {
                          await ref.read(authProvider.notifier).login(
                                email: _emailController.text.trim(),
                                password: _passwordController.text,
                              );
                          // 登录成功后清空表单
                          if (mounted) {
                            _emailController.clear();
                            _passwordController.clear();
                            _isPasswordVisible = false;
                            if (_formKey.currentState != null) {
                              _formKey.currentState!.reset();
                            }
                            // 使用 pushReplacement 而不是 go
                            context.pushReplacement('/');
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
                        child: Text(
                          l10n.loginButton,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
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
                    foregroundColor: Colors.black.withOpacity(0.5),
                  ),
                  child: Text(l10n.loginNoAccount),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: SvgPicture.asset(
                            'assets/images/Rectangle3.svg',
                            width: 80,
                            fit: BoxFit.fitWidth,
                            colorFilter: const ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            l10n.loginContinueWith,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                        Flexible(
                          child: SvgPicture.asset(
                            'assets/images/Rectangle4.svg',
                            width: 80,
                            fit: BoxFit.fitWidth,
                            colorFilter: const ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
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
