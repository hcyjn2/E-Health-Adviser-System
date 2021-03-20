import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {
  const Colors();

  // static const Color loginGradientStart = const Color(0xFFfbab66);
  // static const Color loginGradientEnd = const Color(0xFFf7418c);

  static const Color loginGradientStart = const Color(0xFF99d8e8);
  static const Color loginGradientEnd = const Color(0xFFffe0f1);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
