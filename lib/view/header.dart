import 'package:flutter/material.dart';
import '../controller/mian_controller.dart';

class AppHeader extends StatelessWidget {
  final MianController mianController;

  const AppHeader({super.key, required this.mianController});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 900;

        return ValueListenableBuilder<double>(
          valueListenable: mianController.progress,
          builder: (context, t, _) {
            final double height = isMobile ? 64 : (50 + (30 * t));
            final double shadowOpacity = (1 - t) * 0.22;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 120),
              curve: Curves.easeOut,
              height: height,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  if (shadowOpacity > 0)
                    BoxShadow(
                      color: Colors.black.withOpacity(shadowOpacity),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 16 : width * 0.09,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// LOGO
                    Row(
                      children: [
                        Image.asset("assets/AppLogo1.png", height: 34),

                      ],
                    ),

                    /// DESKTOP MENU
                    if (!isMobile) _DesktopMenu(mianController: mianController),

                    /// MOBILE MENU ICON
                    if (isMobile)
                      _MobileMenuButton(mianController: mianController),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _DesktopMenu extends StatelessWidget {
  final MianController mianController;

  const _DesktopMenu({required this.mianController});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<SectionType>(
      valueListenable: mianController.activeSection,
      builder: (context, active, _) {
        return Row(
          children: [
            NavItem(
              title: 'Home',
              onTap: mianController.scrollToHome,
              isActive: active == SectionType.home,
            ),
            NavItem(
              title: 'Services',
              onTap: mianController.scrollToServices,
              isActive: active == SectionType.services,
            ),
            NavItem(
              title: 'Features',
              onTap: mianController.scrollToFeature,
              isActive: active == SectionType.features,
            ),
            NavItem(
              title: 'Works',
              onTap: mianController.scrollToWork,
              isActive: active == SectionType.works,
            ),
            NavItem(
              title: 'About',
              onTap: mianController.scrollToAboutUs,
              isActive: active == SectionType.about,
            ),
            NavItem(
              title: 'Blog',
              onTap: mianController.scrollToBlog,
              isActive: active == SectionType.blog,
            ),
            NavItem(
              title: 'Contact',
              onTap: mianController.scrollToContact,
              isActive: active == SectionType.contact,
            ),
          ],
        );
      },
    );
  }
}

class _MobileMenuButton extends StatelessWidget {
  final MianController mianController;

  const _MobileMenuButton({required this.mianController});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu, size: 28),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (_) => _MobileMenu(mianController: mianController),
        );
      },
    );
  }
}

class _MobileMenu extends StatelessWidget {
  final MianController mianController;

  const _MobileMenu({required this.mianController});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: ValueListenableBuilder<SectionType>(
          valueListenable: mianController.activeSection,
          builder: (context, active, _) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _MobileNavItem(
                  title: 'Home',
                  active: active == SectionType.home,
                  onTap: () {
                    Navigator.pop(context);
                    mianController.scrollToHome();
                  },
                ),
                _MobileNavItem(
                  title: 'Services',
                  active: active == SectionType.services,
                  onTap: () {
                    Navigator.pop(context);
                    mianController.scrollToServices();
                  },
                ),
                _MobileNavItem(
                  title: 'Features',
                  active: active == SectionType.features,
                  onTap: () {
                    Navigator.pop(context);
                    mianController.scrollToFeature();
                  },
                ),
                _MobileNavItem(
                  title: 'Works',
                  active: active == SectionType.works,
                  onTap: () {
                    Navigator.pop(context);
                    mianController.scrollToWork();
                  },
                ),
                _MobileNavItem(
                  title: 'Aboute Us',
                  active: active == SectionType.about,
                  onTap: () {
                    Navigator.pop(context);
                    mianController.scrollToAboutUs();
                  },
                ),
                _MobileNavItem(
                  title: 'Blog',
                  active: active == SectionType.blog,
                  onTap: () {
                    Navigator.pop(context);
                    mianController.scrollToBlog();
                  },
                ),
                _MobileNavItem(
                  title: 'Contact',
                  active: active == SectionType.contact,
                  onTap: () {
                    Navigator.pop(context);
                    mianController.scrollToContact();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const NavItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            color: isActive ? Colors.indigo : Colors.black87,
          ),
        ),
      ),
    );
  }
}

class _MobileNavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool active;

  const _MobileNavItem({
    required this.title,
    required this.onTap,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: active ? FontWeight.w600 : FontWeight.w500,
          color: active ? Colors.indigo : Colors.black87,
        ),
      ),
      onTap: onTap,
    );
  }
}
