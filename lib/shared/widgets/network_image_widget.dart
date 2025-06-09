import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class NetworkImageWidget extends StatefulWidget {
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
  State<NetworkImageWidget> createState() => _NetworkImageWidgetState();
}

class _NetworkImageWidgetState extends State<NetworkImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.imageUrl,
      width: widget.width,
      height: widget.height,

      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          width: widget.width,
          height: widget.height,
          alignment: Alignment.center,
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
