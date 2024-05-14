import 'package:flutter/material.dart';
import 'package:triilab/extension.dart';
import 'package:triilab/views/agenda/agenda.dart';
import 'package:triilab/views/informations/informations.dart';
import 'package:triilab/views/notifications/notifications.dart';
import 'package:triilab/views/settings/settings.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final pagesAndTitles = {
    'Agenda': const Agenda(),
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // Help
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help),
          ),
          // Fullscreen
          /*
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.fullscreen),
          ),
          */
        ],
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
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: _currentIndex,
        onDestinationSelected: _onItemTapped,
        destinations: <Widget>[
          const NavigationDestination(
            selectedIcon: Icon(Icons.calendar_month),
            icon: Icon(Icons.calendar_month),
            label: 'Agenda',
          ),
          const NavigationDestination(
            selectedIcon: Icon(Icons.notifications_none),
            icon: Icon(Icons.notifications_none),
            label: 'Notifications',
          ),
          const NavigationDestination(
            selectedIcon: Icon(Icons.info),
            icon: Icon(Icons.info),
            label: 'Informations',
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.settings),
            icon: const Icon(Icons.settings),
            label: context.tr('settings'),
          ),
        ],
      ),
    );
  }
}
