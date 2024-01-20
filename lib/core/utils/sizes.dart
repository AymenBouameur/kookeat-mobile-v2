import 'package:flutter/material.dart';

class ScreenSizes {
  static double get width {
    return WidgetsBinding
        .instance.platformDispatcher.views.first.physicalSize.width;
  }

  static double get height {
    return WidgetsBinding
        .instance.platformDispatcher.views.first.physicalSize.height;
  }
}
