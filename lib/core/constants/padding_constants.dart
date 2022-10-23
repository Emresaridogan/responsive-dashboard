import 'package:flutter/material.dart';

class PaddingCostants {
  static PaddingCostants? _instance;
  static PaddingCostants get instance {
    _instance ??= PaddingCostants._init();
    return _instance!;
  }

  PaddingCostants._init();

  final midPaddingSize = 16.0;

  final lowPaddingAll = const EdgeInsets.all(5);
  final midPaddingAll = const EdgeInsets.all(10);
  final highPaddingAll = const EdgeInsets.all(15);
}
