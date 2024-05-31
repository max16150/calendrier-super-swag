import 'package:flutter/material.dart';
import 'package:triilab/extension.dart';

class TitledButton extends StatelessWidget {
  const TitledButton({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      color: context.colors.secondaryContainer,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    Text(subtitle, style: Theme.of(context).textTheme.titleSmall),
                  ],
                ),
              ),
              const Icon(Icons.arrow_right_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
