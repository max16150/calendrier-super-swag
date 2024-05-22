import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triilab/extension.dart';
import 'package:triilab/providers/fullscreen_provider.dart';
import 'package:triilab/views/agenda/agenda_screen.dart';
import 'package:triilab/views/informations/informations.dart';
import 'package:triilab/views/notifications/notifications.dart';
import 'package:triilab/views/settings/settings.dart';
import 'package:triilab/widgets/retractable_appbar.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final pagesAndTitles = {
    'Agenda': const AgendaScreen(),
    'Notifications': const Notifications(),
    'Informations': const Informations(),
    'Settings': const Settings(),
  };

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RetractableAppBar(
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: Row(
            key: ValueKey<String>(pagesAndTitles.keys.elementAt(_currentIndex)),
            children: [
              Expanded(
                child: Text(
                  pagesAndTitles.keys.elementAt(_currentIndex),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help),
          ),
          IconButton(
            onPressed: () {
              context.read<FullscreenProvider>().toggleFullscreen();
            },
            icon: const Icon(Icons.fullscreen),
          ),
        ],
      ),
      floatingActionButton: ListenableBuilder(
        listenable: context.read<FullscreenProvider>(),
        builder: (context, _) {
          return AnimatedCrossFade(
            duration: const Duration(milliseconds: 150),
            crossFadeState:
                context.read<FullscreenProvider>().isFullscreen ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: Opacity(
              opacity: 0.8,
              child: FloatingActionButton(
                elevation: 0,
                onPressed: () {
                  context.read<FullscreenProvider>().toggleFullscreen();
                },
                child: const Icon(Icons.fullscreen_exit),
              ),
            ),
            secondChild: const SizedBox.shrink(),
          );
        },
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 150),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: pagesAndTitles.values.elementAt(_currentIndex),
      ),
      bottomNavigationBar: ListenableBuilder(
          listenable: context.read<FullscreenProvider>(),
          builder: (context, _) {
            return AnimatedCrossFade(
              duration: const Duration(milliseconds: 150),
              sizeCurve: Curves.easeInOut,
              crossFadeState: context.read<FullscreenProvider>().isFullscreen
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: NavigationBar(
                labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
                selectedIndex: _currentIndex,
                onDestinationSelected: _onItemTapped,
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
            );
          }),
    );
  }
}
