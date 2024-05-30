import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triilab/extension.dart';
import 'package:triilab/providers/fullscreen_provider.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    required this.currentIndex,
    required this.onItemTapped,
    super.key,
  });

  final int currentIndex;
  final void Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    final isFullscreen = context.watch<FullscreenProvider>().isFullscreen;
    return ListenableBuilder(
      listenable: context.read<FullscreenProvider>(),
      builder: (context, _) => AnimatedCrossFade(
        duration: const Duration(milliseconds: 150),
        sizeCurve: Curves.easeInOut,
        crossFadeState: isFullscreen ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        firstChild: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: currentIndex,
          onDestinationSelected: onItemTapped,
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: const Icon(Icons.calendar_month),
              icon: const Icon(Icons.calendar_month),
              label: context.tr('agenda'),
            ),
            NavigationDestination(
              selectedIcon: const Icon(Icons.notifications_none),
              icon: const Icon(Icons.notifications_none),
              label: context.tr('notifications'),
            ),
            NavigationDestination(
              selectedIcon: const Icon(Icons.info),
              icon: const Icon(Icons.info),
              label: context.tr('informations'),
            ),
            NavigationDestination(
              selectedIcon: const Icon(Icons.settings),
              icon: const Icon(Icons.settings),
              label: context.tr('settings'),
            ),
          ],
        ),
        secondChild: const SizedBox(
          height: 0,
          width: double.infinity,
        ),
      ),
    );
  }
}
