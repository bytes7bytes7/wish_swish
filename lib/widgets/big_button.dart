import 'package:flutter/material.dart';

const _widthFactor = 1.0;

class BigButton extends StatelessWidget {
  const BigButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: _widthFactor,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
