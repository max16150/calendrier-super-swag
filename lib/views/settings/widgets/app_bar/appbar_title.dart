import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/settings_export.dart';


// ignore_for_file: must_be_immutable
class AppBarTitle extends StatelessWidget {
  String text;
  EdgeInsetsGeometry? margin;
  Function? onTap;

  AppBarTitle({Key? key, required this.text, this.margin, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Accédez au ThemeProvider à l'aide de Provider.of
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: TextStyle(
            // Utilisez ThemeProvider pour obtenir les propriétés du thème
            fontSize: 20, // Exemple de taille de police
            fontWeight: FontWeight.bold,
            color: themeProvider.seedColor, // Utilisez la couleur de base du ThemeProvider
          ),
        ),
      ),
    );
  }
}
