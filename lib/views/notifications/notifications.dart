import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:triilab/extension.dart';
import 'package:triilab/providers/theme_provider.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Test(),
    );
  }
}

class _Test extends StatelessWidget {
  const _Test();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 8.0,
            spacing: 8.0,
            children: [
              ElevatedButton(
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false).randomizeSeedColor();
                },
                child: Text(context.tr('randomize_seed_color')),
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                },
                child: Text(context.tr('toggle_theme')),
              ),
              ElevatedButton(
                onPressed: () {
                  if (Intl.getCurrentLocale() != 'fr') {
                    debugPrint('--> Traduction francaise');
                    context.changeLocale(const Locale('fr'));
                  } else {
                    debugPrint('--> Traduction anglaise');
                    context.changeLocale(const Locale('en'));
                  }
                },
                child: Text(context.tr('toggle_language')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
