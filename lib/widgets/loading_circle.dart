import 'package:flutter/material.dart';

import '../constants/measures.dart' as const_measures;

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: const_measures.circleLoadingSize,
        width: const_measures.circleLoadingSize,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
