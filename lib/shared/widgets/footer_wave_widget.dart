import 'package:flutter/material.dart';

class FooterWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start with the wave at the top
    path.moveTo(0, 40);

    // Wave curve
    path.quadraticBezierTo(size.width / 4, 0, size.width / 2, 40);
    path.quadraticBezierTo(size.width * 3 / 4, 80, size.width, 40);

    // Complete rectangle shape
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class FooterWaveWidget extends StatelessWidget {
  const FooterWaveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: FooterWaveClipper(),
      child: Container(
        width: double.infinity,
        height: 150.0,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
