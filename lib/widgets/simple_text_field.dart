import 'package:flutter/material.dart';

class SimpleTextField extends StatelessWidget {
  const SimpleTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.validator,
    this.isObscure = false,
  });

  final TextEditingController controller;
  final String hint;
  final String? Function(String?) validator;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      validator: validator,
      style: theme.textTheme.subtitle2,
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }
}
