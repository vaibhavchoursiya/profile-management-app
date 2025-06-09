import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:profile_management_app/shared/helper_methods/helper_methods.dart';

class LoadingModelBarrierWidget extends StatelessWidget {
  const LoadingModelBarrierWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: [
          ModalBarrier(dismissible: false),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            width: double.infinity,
            height: HelperMethods.getResponsiveHeight(context),
            child: Center(
              child: LoadingAnimationWidget.dotsTriangle(
                color: Theme.of(context).colorScheme.primary,
                size: 50.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
