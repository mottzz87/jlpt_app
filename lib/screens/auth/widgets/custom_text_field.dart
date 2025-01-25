import 'package:flutter/material.dart';

class PasswordRequirement {
  final String title;
  final bool isMet;
  final IconData icon;

  const PasswordRequirement(this.title, this.isMet, {this.icon = Icons.check});
}

class PasswordStrength {
  final String level;
  final Color color;
  final double strength;
  final List<PasswordRequirement> requirements;

  const PasswordStrength(
      this.level, this.color, this.strength, this.requirements);

  static PasswordStrength empty() {
    return PasswordStrength('', Colors.white.withOpacity(0.5), 0.0, []);
  }
}

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final bool? isPasswordVisible;
  final Function()? onPasswordVisibilityToggle;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool showPasswordStrength;

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
    this.showPasswordStrength = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  String? _errorText;
  PasswordStrength? _passwordStrength;

  @override
  void initState() {
    super.initState();
    if (widget.isPassword) {
      _passwordStrength = PasswordStrength.empty();
    }
  }

  PasswordStrength? _checkPasswordStrength(String password) {
    if (password.isEmpty) {
      return PasswordStrength.empty();
    }

    final requirements = [
      PasswordRequirement(
        '长度至少为 8 位',
        password.length >= 8,
        icon: Icons.format_size,
      ),
      PasswordRequirement(
        '包含大写字母',
        password.contains(RegExp(r'[A-Z]')),
        icon: Icons.text_fields,
      ),
      PasswordRequirement(
        '包含小写字母',
        password.contains(RegExp(r'[a-z]')),
        icon: Icons.text_fields,
      ),
      PasswordRequirement(
        '包含数字',
        password.contains(RegExp(r'[0-9]')),
        icon: Icons.numbers,
      ),
      PasswordRequirement(
        '包含特殊字符',
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
        icon: Icons.star,
      ),
    ];

    int metCount = requirements.where((req) => req.isMet).length;
    double strength = metCount / requirements.length;

    String level;
    Color color;
    if (strength <= 0.3) {
      level = '弱';
      color = Colors.red.shade300;
    } else if (strength <= 0.6) {
      level = '中';
      color = Colors.orange.shade300;
    } else if (strength < 1) {
      level = '强';
      color = Colors.yellow.shade300;
    } else {
      level = '非常强';
      color = Colors.green.shade300;
    }

    return PasswordStrength(level, color, strength, requirements);
  }

  void _validateInput(String? value) {
    setState(() {
      if (widget.validator != null) {
        _errorText = widget.validator!(value);
      }
      if (widget.isPassword) {
        _passwordStrength = _checkPasswordStrength(value ?? '');
      }
    });
    if (widget.onChanged != null && value != null) {
      widget.onChanged!(value);
    }
  }

  void reset() {
    if (mounted) {
      setState(() {
        _errorText = null;
        _passwordStrength = widget.isPassword ? PasswordStrength.empty() : null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final passwordStrength = _passwordStrength ?? PasswordStrength.empty();
    final color = passwordStrength.color;
    final requirements = passwordStrength.requirements;
    final level = passwordStrength.level;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(8),
            border: widget.showPasswordStrength &&
                    widget.isPassword &&
                    _passwordStrength != null
                ? Border.all(
                    color: color.withOpacity(0.3),
                    width: 1,
                  )
                : null,
          ),
          child: TextFormField(
            controller: widget.controller,
            obscureText:
                widget.isPassword && !(widget.isPasswordVisible ?? false),
            onChanged: _validateInput,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Icon(widget.icon,
                    color: Colors.white.withOpacity(0.5), size: 20),
              ),
              prefixIconConstraints: const BoxConstraints(minWidth: 44),
              suffixIcon: widget.isPassword
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.showPasswordStrength &&
                            _passwordStrength != null &&
                            level.isNotEmpty)
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              level,
                              style: TextStyle(
                                color: color,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        IconButton(
                          icon: Icon(
                            widget.isPasswordVisible ?? false
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white.withOpacity(0.5),
                            size: 20,
                          ),
                          onPressed: widget.onPasswordVisibilityToggle,
                        ),
                      ],
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              errorStyle: const TextStyle(height: 0, fontSize: 0),
              errorText: null,
            ),
          ),
        ),
        if (_errorText != null)
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: _errorText != null ? 1 : 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 14,
                    color: Colors.red.shade300,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      _errorText!,
                      style: TextStyle(
                        color: Colors.red.shade300,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        // if (widget.showPasswordStrength &&
        //     widget.isPassword &&
        //     requirements.isNotEmpty)
        //   Padding(
        //     padding: const EdgeInsets.only(top: 16),
        //     child: Wrap(
        //       spacing: 8,
        //       runSpacing: 8,
        //       children: requirements.map((req) {
        //         return Container(
        //           padding: const EdgeInsets.symmetric(
        //             horizontal: 12,
        //             vertical: 6,
        //           ),
        //           decoration: BoxDecoration(
        //             color: req.isMet
        //                 ? color.withOpacity(0.1)
        //                 : Colors.white.withOpacity(0.05),
        //             borderRadius: BorderRadius.circular(16),
        //             border: Border.all(
        //               color: req.isMet ? color : Colors.white.withOpacity(0.1),
        //               width: 1,
        //             ),
        //           ),
        //           child: Row(
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               Icon(
        //                 req.isMet ? req.icon : Icons.circle_outlined,
        //                 size: 14,
        //                 color:
        //                     req.isMet ? color : Colors.white.withOpacity(0.5),
        //               ),
        //               const SizedBox(width: 6),
        //               Text(
        //                 req.title,
        //                 style: TextStyle(
        //                   color:
        //                       req.isMet ? color : Colors.white.withOpacity(0.5),
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.w500,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         );
        //       }).toList(),
        //     ),
        //   ),
      ],
    );
  }
}
