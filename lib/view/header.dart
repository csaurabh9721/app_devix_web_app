import 'package:flutter/material.dart';

import '../utiles/constants.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: 72,
      collapsedHeight: 56,
      toolbarHeight: 56,
      pinned: true,
      forceElevated: true,
      scrolledUnderElevation: 4,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.black.withValues(alpha: 0.4),

      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final double t = ((constraints.maxHeight - 56) / (72 - 56)).clamp(0.0, 1.0);

          final double iconSize = 20 + (6 * t);
          final double fontSize = 14 + (4 * t);

          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                        child: Icon(Icons.apps, size: iconSize, color: Colors.indigo),
                      ),
                      const SizedBox(width: 6),
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600, color: Colors.black87),
                        child: SelectableText(StringConstants.appName),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      NavItem(title: 'Home'),
                      NavItem(title: 'Services'),
                      NavItem(title: 'Features'),
                      NavItem(title: 'Works'),
                      NavItem(title: 'Blog'),
                      NavItem(title: 'Contact'),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;

  const NavItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: SelectableText(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black87),
      ),
    );
  }
}
