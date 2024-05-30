import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triilab/extension.dart';
import 'package:triilab/providers/agenda_provider.dart';
import 'package:triilab/widgets/retractable_appbar.dart';

class AppRetractableBar extends StatelessWidget implements PreferredSizeWidget {
  const AppRetractableBar({
    required this.pagesAndTitles,
    required this.actions,
    required this.currentIndex,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  final Map<String, StatelessWidget> pagesAndTitles;
  final List<Widget> actions;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return RetractableAppBar(
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 150),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: Row(
          key: ValueKey<String>(pagesAndTitles.keys.elementAt(currentIndex)),
          children: [
            SafeArea(
              child: SizedBox(
                height: preferredSize.height,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pagesAndTitles.keys.elementAt(currentIndex),
                    ),
                    if (currentIndex == 0)
                      Consumer<AgendaProvider>(
                        builder: (context, value, child) {
                          final group = value.selectedGroup;
                          if (group == null) {
                            return const SizedBox.shrink();
                          }
                          return Text(
                            value.selectedGroup?.name ?? context.tr('select_group'),
                            style: context.textTheme.labelLarge,
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: actions,
    );
  }
}
