import 'package:flutter/material.dart';

class SimpleTextField extends StatelessWidget {
  const SimpleTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.validator,
    this.enabled = true,
    this.isObscure = false,
  });

  final TextEditingController controller;
  final String hint;
  final String? Function(String?) validator;
  final bool enabled;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      validator: (_) => validator(controller.text),
      // validator provides previous controller.text, so I need to pass current text manually
      enabled: enabled,
      style: theme.textTheme.subtitle2,
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }
}
