import 'package:flutter/material.dart';

class FeatureItem {
  final IconData icon;
  final String title;
  final String desc;

  FeatureItem({
    required this.icon,
    required this.title,
    required this.desc,
  });
}

class FeatureData {
  final List<FeatureItem> features = [
    FeatureItem(
      icon: Icons.trending_up,
      title: 'Scales with Your Business',
      desc:
      'Our systems are designed to grow effortlessly, supporting new users, features, and markets without rework.',
    ),
    FeatureItem(
      icon: Icons.settings_suggest_outlined,
      title: 'Thoughtful Engineering',
      desc:
      'We prioritize clean architecture, long-term maintainability, and performance at every layer.',
    ),
    FeatureItem(
      icon: Icons.timer_outlined,
      title: 'Predictable Delivery',
      desc:
      'Clear milestones, realistic timelines, and no last-minute surprises.',
    ),
    FeatureItem(
        icon: Icons.shield_outlined,
        title: 'Security by Default',
        desc:
        'Security is not an afterthought—it is embedded into design, APIs, and infrastructure.',
    ),
    FeatureItem(
      icon: Icons.groups_outlined,
      title: 'True Collaboration',
      desc:
      'You work directly with our engineers and designers, ensuring clarity and alignment.',
    ),
    FeatureItem(
      icon: Icons.handshake_outlined,
      title: 'Long-Term Partnership',
      desc:
      'We stay with you beyond launch, continuously improving and evolving your product.',
    ),
  ];
}


