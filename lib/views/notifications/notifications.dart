import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:triilab/extension.dart';

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
          const Icon(
            Icons.update_outlined,
            size: 64,
          ),
          const Gap(16),
          Text(
            context.tr('feature_coming_soon'),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
