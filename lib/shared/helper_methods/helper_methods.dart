import 'package:flutter/widgets.dart';

class HelperMethods {
  /// Responsive Height and Width
  ///
  static double getResponsiveHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static double getResponsiveWidth(context) {
    return MediaQuery.of(context).size.width;
  }
}
