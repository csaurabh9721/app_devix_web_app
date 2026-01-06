import 'package:flutter/material.dart';

class MianController {
  final ScrollController scrollController = ScrollController();
  final ValueNotifier<double> progress = ValueNotifier(1.0);
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey featuresKey = GlobalKey();
  final GlobalKey worksKey = GlobalKey();
  final GlobalKey blogKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
        alignment: progress.value > 0.5 ? 0.15 : 0.1,
      );
    }
  }

  void scrollToHome() {
    final context = homeKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
        alignment: progress.value > 0.5 ? 0.15 : 0.1,
      );
    }
  }

  void scrollToServices() {
    final context = servicesKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
        alignment: progress.value > 0.5 ? 0.15 : 0.1,
      );
    }
  }

  void scrollToFeature() {
    final context = featuresKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
        alignment: progress.value > 0.5 ? 0.15 : 0.1,
      );
    }
  }

  void scrollToWork() {
    final context = worksKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
        alignment: progress.value > 0.5 ? 0.15 : 0.1,
      );
    }
  }

  void scrollToBlog() {
    final context = blogKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
        alignment: progress.value > 0.5 ? 0.15 : 0.1,
      );
    }
  }

  void scrollToContact() {
    final context = contactKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
        alignment: progress.value > 0.5 ? 0.15 : 0.1,
      );
    }
  }
}
