import 'package:flutter/material.dart';

class ServiceData {
  final List<ServiceItem> services = [
    ServiceItem(
      icon: Icons.phone_iphone,
      title: 'Mobile App Development',
      desc:
      'High-quality native and cross-platform mobile applications designed for performance, scalability, and great user experience.',
      features: [
        'iOS & Android Applications',
        'Flutter & Cross-Platform Development',
        'App Store & Play Store Deployment',
      ],
      accentColor: const Color(0xFF3949AB),
    ),

    ServiceItem(
      icon: Icons.language,
      title: 'Web Application Development',
      desc:
      'Modern, secure, and scalable web applications built with a strong focus on usability and performance.',
      features: [
        'Responsive Web Applications',
        'Angular & React Development',
        'Performance & SEO Optimization',
      ],
      accentColor: const Color(0xFF00897B),
    ),

    ServiceItem(
      icon: Icons.cloud,
      title: 'Backend & API Development',
      desc:
      'Robust & Secure backend systems and APIs engineered for scalability, security, and long-term growth.',
      features: [
        'RESTful API Development',
        'Spring Boot & .NET Core',
        'Database Design & Optimization',
      ],
      accentColor: const Color(0xFF6D4C41),
    ),

    ServiceItem(
      icon: Icons.rocket_launch,
      title: 'MVP for Startups',
      desc:
      'End-to-end MVP development to help startups validate ideas, launch faster, and grow confidently.',
      features: [
        'Product Strategy & Planning',
        'Rapid MVP Development',
        'Core Feature Implementation',
      ],
      accentColor: const Color(0xFFD81B60),
    ),

    ServiceItem(
      icon: Icons.settings,
      title: 'App Maintenance & Scaling',
      desc:
      'Continuous & long term maintenance and scaling support and optimization to keep your product reliable, fast, and scalable. ',
      features: [
        'Bug Fixes & Performance Tuning',
        'Feature Enhancements',
        'Long-Term Maintenance',
      ],
      accentColor:  Colors.cyan,
    ),

    ServiceItem(
      icon: Icons.design_services,
      title: 'UI/UX & Product Design',
      desc:
      'User-centered design that combines aesthetics with usability to deliver engaging digital experiences.',
      features: [
        'UI/UX Design & Prototyping',
        'Design Systems & Style Guides',
        'Developer-Ready Design Handoffs',
      ],
      accentColor: Colors.orange,
    ),
  ];

}

class ServiceItem {
  final IconData icon;
  final String title;
  final String desc;
  final List<String> features;
  final Color accentColor;

  const ServiceItem({required this.icon, required this.title, required this.desc, required this.features,required this.accentColor});
}
