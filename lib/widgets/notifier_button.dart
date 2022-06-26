import 'package:flutter/material.dart';

class NotifierButton extends StatefulWidget {
  const NotifierButton({
    super.key,
    required this.initValue,
    required this.onTrueChild,
    required this.onFalseChild,
    required this.onTrueCallback,
    required this.onFalseCallback,
  });

  final bool initValue;
  final Widget onTrueChild;
  final Widget onFalseChild;
  final VoidCallback onTrueCallback;
  final VoidCallback onFalseCallback;

  @override
  State<NotifierButton> createState() => _NotifierButtonState();
}

class _NotifierButtonState extends State<NotifierButton> {
  late final ValueNotifier<bool> _notifier;

  @override
  void initState() {
    super.initState();

    _notifier = ValueNotifier(widget.initValue);
  }

  @override
  void dispose() {
    _notifier.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _notifier,
      builder: (context, value, child) {
        return ElevatedButton(
          onPressed: () {
            final oldValue = _notifier.value;

            if (oldValue) {
              widget.onTrueCallback();
            } else {
              widget.onFalseCallback();
            }

            _notifier.value = !oldValue;
          },
          style: ButtonStyle(
            alignment: Alignment.center,
            padding: MaterialStateProperty.all(
              EdgeInsets.zero,
            ),
          ),
          child: value ? widget.onTrueChild : widget.onFalseChild,
        );
      },
    );
  }
}
