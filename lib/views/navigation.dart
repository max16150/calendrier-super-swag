import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triilab/providers/fullscreen_provider.dart';
import 'package:triilab/views/agenda/agenda_screen.dart';
import 'package:triilab/views/agenda/agenda_selection_dialog.dart';
import 'package:triilab/views/informations/informations.dart';
import 'package:triilab/views/notifications/notifications.dart';
import 'package:triilab/views/settings/settings.dart';
import 'package:triilab/widgets/app_floating_action_button.dart';
import 'package:triilab/widgets/app_navigation_bar.dart';
import 'package:triilab/widgets/app_retractable_bar.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final pagesAndTitles = {
    'agenda': const AgendaScreen(),
    'notifications': const Notifications(),
    'informations': const Informations(),
    'settings': const Settings(),
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

  void _openSelectDialog(BuildContext context) async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => const AgendaSelectionDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppRetractableBar(
        currentIndex: _currentIndex,
        pagesAndTitles: pagesAndTitles,
        actions: [
          if (_currentIndex == 0) ...[
            IconButton(
              onPressed: () {
                _openSelectDialog(context);
              },
              icon: const Icon(Icons.calendar_today),
            ),
            IconButton(
              onPressed: () => context.read<FullscreenProvider>().toggle(),
              icon: const Icon(Icons.fullscreen),
            ),
          ],
        ],
      ),
      floatingActionButton: const AppFloatingActionButton(),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 150),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
        child: pagesAndTitles.values.elementAt(_currentIndex),
      ),
      bottomNavigationBar: AppNavigationBar(
        currentIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
