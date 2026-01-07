import 'package:flutter/material.dart';

class MianController {
  final ValueNotifier<SectionType> activeSection = ValueNotifier(
    SectionType.home,
  );
  final ScrollController scrollController = ScrollController();
  final ValueNotifier<double> progress = ValueNotifier(1.0);
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey featuresKey = GlobalKey();
  final GlobalKey worksKey = GlobalKey();
  final GlobalKey blogKey = GlobalKey();
  final GlobalKey aboutUs = GlobalKey();
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
    activeSection.value = SectionType.home;

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
    activeSection.value = SectionType.services;

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
    activeSection.value = SectionType.features;

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
    activeSection.value = SectionType.works;

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

  void scrollToAboutUs() {
    activeSection.value = SectionType.about;

    final context = aboutUs.currentContext;
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
    activeSection.value = SectionType.blog;

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
    activeSection.value = SectionType.contact;

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

  void dispose() {
    scrollController.dispose();
    progress.dispose();
    activeSection.dispose();
  }
}

enum SectionType { home, services, features, works, about, blog, contact }
