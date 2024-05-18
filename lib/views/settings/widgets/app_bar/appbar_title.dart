import 'package:flutter/material.dart';
import '../../core/settings_export.dart';

// ignore_for_file: must_be_immutable
class AppBarTitle extends StatelessWidget {
  String text;
  EdgeInsetsGeometry? margin;
  Function? onTap;

  AppBarTitle({Key? key, required this.text, this.margin, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
          ),
        ),
      ),
    );
  }
}