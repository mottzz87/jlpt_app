import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jlpt_app/core/theme/theme_utils.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:email_validator/email_validator.dart';
import 'package:jlpt_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:jlpt_app/features/auth/presentation/widgets/custom_text_field.dart';
// import 'package:jlpt_app/features/auth/presentation/widgets/social_button.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
                Text(
                  l10n.registerCreateAccount,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  l10n.registerStartJourney,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacityValue(0.5),
                  ),
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  key: _emailFieldKey,
                  controller: _emailController,
                  hintText: l10n.registerEmailHint,
                  icon: Icons.email_outlined,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return l10n.registerEmailRequired;
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(val)) {
                      return l10n.registerEmailInvalid;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  key: _passwordFieldKey,
                  controller: _passwordController,
                  hintText: l10n.registerPasswordHint,
                  icon: Icons.lock_outline,
                  isPassword: true,
                  showPasswordStrength: true,
                  isPasswordVisible: _isPasswordVisible,
                  onPasswordVisibilityToggle: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  validator: (val) =>
                      val!.length < 6 ? l10n.registerPasswordTooShort : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  key: _confirmPasswordFieldKey,
                  controller: _confirmPasswordController,
                  hintText: l10n.registerConfirmPasswordHint,
                  icon: Icons.lock_outline,
                  isPassword: true,
                  showPasswordStrength: false,
                  isPasswordVisible: _isConfirmPasswordVisible,
                  onPasswordVisibilityToggle: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                  validator: (val) => val != _passwordController.text
                      ? l10n.registerPasswordMismatch
                      : null,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      // 先触发所有字段的验证
                      _emailFieldKey.currentState?.validate();
                      _passwordFieldKey.currentState?.validate();
                      _confirmPasswordFieldKey.currentState?.validate();

                      if (_formKey.currentState!.validate()) {
                        try {
                          await ref.read(authProvider.notifier).signUp(
                                _emailController.text.trim(),
                                _passwordController.text,
                              );
                          // 注册成功后自动切换到登录页面
                          widget.onToggleView();
                        } catch (e) {
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text(l10n.registerFailure(e.toString())),
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
                          l10n.registerButton,
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
                    foregroundColor: Colors.black.withOpacityValue(0.5),
                  ),
                  child: Text(l10n.registerHaveAccount),
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
