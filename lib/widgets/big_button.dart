import 'package:flutter/material.dart';

const _widthFactor = 1.0;

class BigButton extends StatelessWidget {
  const BigButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: _widthFactor,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
