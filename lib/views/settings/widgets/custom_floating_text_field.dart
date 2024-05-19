import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/settings_export.dart';

class CustomFloatingTextField extends StatelessWidget {
  final Alignment? alignment;
  final double? width;
  final EdgeInsets? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextStyle? textStyle;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool filled;
  final FormFieldValidator<String>? validator;

  CustomFloatingTextField({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: floatingTextFieldWidget(context))
        : floatingTextFieldWidget(context);
  }

  Widget floatingTextFieldWidget(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      width: width ?? double.maxFinite,
      child: TextFormField(
        scrollPadding: scrollPadding ??
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        controller: controller,
        focusNode: focusNode,
        autofocus: autofocus,
        style: textStyle ?? CustomTextStyles.bodyMediumGray400(context),
        obscureText: obscureText,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(context, themeProvider),
        validator: validator,
      ),
    );
  }

  InputDecoration _buildDecoration(
      BuildContext context, ThemeProvider themeProvider) {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: hintStyle ?? Theme.of(context).textTheme.bodyLarge,
      labelText: labelText ?? "",
      labelStyle: labelStyle ?? Theme.of(context).textTheme.bodyLarge,
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      isDense: true,
      contentPadding:
          contentPadding ?? EdgeInsets.fromLTRB(16.0, 17.0, 16.0, 19.0),
      fillColor: fillColor ?? themeProvider.seedColor,
      filled: filled,
      border: borderDecoration ?? _buildBorder(context, themeProvider),
      enabledBorder: borderDecoration ?? _buildBorder(context, themeProvider),
      focusedBorder: borderDecoration ?? _buildFocusedBorder(context),
    );
  }

  OutlineInputBorder _buildBorder(
      BuildContext context, ThemeProvider themeProvider) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(
        color: themeProvider.themeMode == ThemeMode.dark
            ? themeProvider
                .seedColor // Utilisez la couleur de base pour le thème sombre
            : Theme.of(context)
                .colorScheme
                .errorContainer, // Couleur par défaut pour le thème clair
        width: 1.0,
      ),
    );
  }

  OutlineInputBorder _buildFocusedBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(
        color: Theme.of(context)
            .colorScheme
            .primary, // Utilisez la couleur primaire pour la bordure focalisée
        width: 1.0,
      ),
    );
  }
}
