import 'package:flutter/widgets.dart';

class AuthScreenCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path();

    path.moveTo(0, 140.0);

    path.quadraticBezierTo(2.0, 70.0, 60.0, 70.0);
    path.lineTo(width - 100, 70.0);
    path.quadraticBezierTo(width - 10.0, 70.0, width, 0.0);

    path.lineTo(width, height);
    path.lineTo(0.0, height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // return false;
    return true;
  }
}
