import 'package:flutter/material.dart';

class ColorCostants {
  static ColorCostants? _instance;
  static ColorCostants get instance {
    _instance ??= ColorCostants._init();
    return _instance!;
  }

  ColorCostants._init();

  final Color primary = const Color(0xFF2697FF);
  final Color secondColor = const Color(0xFF2A2D3E);
  final Color backgroundColor = const Color(0xFF212332);
}
