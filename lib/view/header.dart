import 'package:flutter/material.dart';

import '../controller/mian_controller.dart';
import '../utiles/constants.dart';

class AppHeader extends StatelessWidget {
  final MianController mianController;

  const AppHeader({super.key, required this.mianController});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return ValueListenableBuilder<double>(
      valueListenable: mianController.progress,
      builder: (context, t, _) {
        final double height = 50 + (30 * t); // 80 → 50
        final double fontSize = 14 + (4 * t);
        final double shadowOpacity = (1 - t) * 0.25;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOut,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              if (shadowOpacity > 0)
                BoxShadow(
                  color: Colors.black.withValues(alpha: shadowOpacity),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Logo
                Row(
                  children: [
                    const Icon(Icons.apps, color: Colors.indigo, size: 24),
                    const SizedBox(width: 6),
                    Text(
                      StringConstants.appName,
                      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600, color: Colors.black87),
                    ),
                  ],
                ),

                /// Menu
                Row(
                  children: [
                    NavItem(title: 'Home', onTap: () => mianController.scrollToHome()),
                    NavItem(title: 'Services', onTap: () => mianController.scrollToServices()),
                    NavItem(title: 'Features', onTap: () => mianController.scrollToFeature()),
                    NavItem(title: 'Works', onTap: () => mianController.scrollToWork()),
                    NavItem(title: 'Blog', onTap: () => mianController.scrollToBlog()),
                    NavItem(title: 'Contact', onTap: () => mianController.scrollToContact()),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final Function() onTap;

  const NavItem({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
      ),
    );
  }
}
