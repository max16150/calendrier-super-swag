import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:triilab/extension.dart';

class NotificationSettingsPannel extends StatelessWidget {
  const NotificationSettingsPannel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('notifications_settings'),
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
                      context.tr('new_weeks'),
                      style: context.textTheme.titleMedium,
                    ),
                    const Gap(8),
                    Text(
                      context.tr('choose_new_weeks'),
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Gap(16),
              Switch(
                value: false,
                onChanged: (value) {
                  final snackBar = SnackBar(
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                    content: Text(context.tr('feature_coming_soon')),
                  );

                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                      context.tr('edits'),
                      style: context.textTheme.titleMedium,
                    ),
                    const Gap(8),
                    Text(
                      context.tr('choose_edits'),
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Gap(16),
              Switch(
                value: false,
                onChanged: (value) {
                  final snackBar = SnackBar(
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                    content: Text(context.tr('feature_coming_soon')),
                  );

                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
