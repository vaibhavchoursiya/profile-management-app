import 'package:flutter/material.dart';

class LoadingModelBarrierWidget extends StatelessWidget {
  const LoadingModelBarrierWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: [
          ModalBarrier(dismissible: false),
          Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
