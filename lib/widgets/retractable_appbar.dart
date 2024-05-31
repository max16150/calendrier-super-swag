//Retractable appbar
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triilab/providers/fullscreen_provider.dart';

class RetractableAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions;
  final Widget? leading;

  const RetractableAppBar({
    super.key,
    required this.title,
    required this.actions,
    this.leading,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    final isAppBarExpanded = !context.watch<FullscreenProvider>().isFullscreen;
    return PreferredSize(
      preferredSize: Size.fromHeight(isAppBarExpanded ? (56 + MediaQuery.of(context).padding.top) : 0.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        height: isAppBarExpanded ? (56.0 + MediaQuery.of(context).padding.top) : 0.0,
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: actions,
          title: title,
        ),
      ),
    );
  }
}
