import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class NetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  const NetworkImageWidget({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,

      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: LoadingAnimationWidget.fourRotatingDots(
            color: Theme.of(context).colorScheme.primary,
            size: 30.0,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) => Text("not found"),
    );
  }
}
