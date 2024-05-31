import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:lab_3il/lab_3il.dart';
import 'package:provider/provider.dart';
import 'package:triilab/extension.dart';
import 'package:triilab/providers/theme_provider.dart';

class ApplicationSettingsPannel extends StatelessWidget {
  const ApplicationSettingsPannel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('application_settings'),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Gap(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr('dark_theme'),
                      style: context.textTheme.titleMedium,
                    ),
                    const Gap(8),
                    Text(
                      context.tr('choose_dark_theme'),
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Gap(16),
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return Switch(
                    value: themeProvider.themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    },
                  );
                },
              )
            ],
          ),
          const Gap(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr('main_color'),
                      style: context.textTheme.titleMedium,
                    ),
                    const Gap(8),
                    Text(
                      context.tr('choose_main_color'),
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Gap(16),
              IconButton(
                icon: const Icon(Icons.palette),
                onPressed: () {
                  context.read<ThemeProvider>().randomizeSeedColor();
                },
              ),
            ],
          ),
          const Gap(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr('language'),
                      style: context.textTheme.titleMedium,
                    ),
                    const Gap(8),
                    Text(
                      context.tr('choose_language'),
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Gap(16),
              IconButton(
                icon: const Icon(Icons.language),
                onPressed: () async {
                  final isFr = Intl.getCurrentLocale() == 'fr';
                  context.changeLocale(Locale(isFr ? 'en' : 'fr')).then(
                        (_) => context.read<Lab3il>().acceptLanguage = Intl.getCurrentLocale(),
                      );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
