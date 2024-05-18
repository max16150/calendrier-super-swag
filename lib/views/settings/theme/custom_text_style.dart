import 'package:flutter/material.dart';
import '../core/settings_export.dart';

extension TextStyleRoboto on TextStyle {
  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply.
class CustomTextStyles {
  // Body text style
  static TextStyle get bodyLargeOnPrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
    color: theme.colorScheme.onPrimaryContainer,
  );

  static TextStyle get bodyMediumGray400 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.gray400,
  );

  // Title text style
  static TextStyle get titleSmallOnPrimaryContainer => theme.textTheme.titleSmall!.copyWith(
    color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
  );

  static TextStyle get titleSmallPurple50 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.purple50,
  );
}