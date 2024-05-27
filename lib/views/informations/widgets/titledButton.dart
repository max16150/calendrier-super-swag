// ignore: file_names
import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        color: Colors.grey,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(subtitle,
                          style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_right_outlined),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
