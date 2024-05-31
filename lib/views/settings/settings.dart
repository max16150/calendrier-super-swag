import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:triilab/extension.dart';
import 'package:triilab/views/settings/privacy_policy/privacy_policy.dart';
import 'package:triilab/views/settings/settings/application_settings_pannel.dart';
import 'package:triilab/views/settings/settings/notification_settings_pannel.dart';
import 'package:triilab/views/settings/settings/version_settings_pannel.dart';
import 'package:triilab/views/settings/terms_of_use/terms_of_use.dart';
import 'Suggestion/suggestion.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
            ),
            child: Column(
              children: [
                NotificationSettingsPannel(),
                Gap(16),
                ApplicationSettingsPannel(),
                Gap(16),
                VersionSettingsPannel(),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: FilledButton.tonal(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const TermsOfUse()),
                      ));
                    },
                    child: Text(context.tr('gcu')),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: FilledButton.tonal(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const PrivacyPolicyScreen()),
                      ));
                    },
                    child: Text(context.tr('privacy_policy')),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => Suggestion()),
                      ));
                    },
                    child: Text(context.tr('suggest_an_improvement')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
