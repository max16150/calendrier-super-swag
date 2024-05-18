import 'package:flutter/material.dart';
import '../core/settings_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillOnPrimary => BoxDecoration(
    color: theme.colorScheme.onPrimary,
  );

  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
    color: theme.colorScheme.primaryContainer,
  );

  static BoxDecoration get fillWhiteA => BoxDecoration(
    color: appTheme.whiteA700,
  );
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder16 => BorderRadius.circular(16);
}