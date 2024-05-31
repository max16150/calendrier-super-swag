import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:lab_3il/lab_3il.dart';
import 'package:provider/provider.dart';
import 'package:triilab/extension.dart';

class VersionSettingsPannel extends StatelessWidget {
  const VersionSettingsPannel({super.key});

  @override
  Widget build(BuildContext context) {
    final String timeZoneName = DateTime.now().timeZoneName;
    String timeZoneOffset = DateTime.now().timeZoneOffset.toString().split(':').first;
    if (!timeZoneOffset.startsWith("-")) {
      timeZoneOffset = "+$timeZoneOffset";
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr('timezone'),
                style: context.textTheme.titleMedium,
              ),
              Text(
                "$timeZoneName (UTC$timeZoneOffset)",
                style: context.textTheme.bodyMedium,
              ),
            ],
          ),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr('version'),
                style: context.textTheme.titleMedium,
              ),
              FutureBuilder<AppVersion>(
                  future: context.read<Lab3il>().informationsService.getLastAppVersion(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(
                        context.tr('error_occured'),
                        style: context.textTheme.bodyMedium,
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text(
                        context.tr('loading'),
                        style: context.textTheme.bodyMedium,
                      );
                    }

                    final AppVersion appVersion = snapshot.data!;
                    final DateFormat formatter = DateFormat('MMM yyyy');

                    return Text(
                      "${appVersion.version} - ${formatter.format(appVersion.updatedAt).toCapitalized()}",
                      style: context.textTheme.bodyMedium,
                    );
                  }),
            ],
          ),
          const Gap(8),
          Text(
            context.tr('you_are_up_to_date'),
            style: context.textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
