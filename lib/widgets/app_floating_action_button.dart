import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triilab/providers/fullscreen_provider.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: context.read<FullscreenProvider>(),
      builder: (context, _) => AnimatedCrossFade(
        duration: const Duration(milliseconds: 150),
        crossFadeState:
            context.read<FullscreenProvider>().isFullscreen ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        firstChild: Opacity(
          opacity: 0.8,
          child: FloatingActionButton(
            elevation: 0,
            onPressed: () => context.read<FullscreenProvider>().toggle(),
            child: const Icon(Icons.fullscreen_exit),
          ),
        ),
        secondChild: const SizedBox.shrink(),
      ),
    );
  }
}
