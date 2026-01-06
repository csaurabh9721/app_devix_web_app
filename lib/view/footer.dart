import 'package:flutter/material.dart';

import '../utiles/constants.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0F172A), // dark navy
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 800;

              return Column(
                children: [
                  Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Company Info
                      const _FooterCompanyInfo(),

                      if (!isMobile) const SizedBox(width: 40),
                      if (!isMobile) const _FooterLinks(),

                      if (!isMobile) const SizedBox(width: 40),
                      if (!isMobile) const _FooterServices(),

                      if (!isMobile) const SizedBox(width: 40),
                      if (!isMobile) const _FooterContact(),
                    ],
                  ),

                  if (isMobile) ...const [
                    SizedBox(height: 40),
                    _FooterLinks(),
                    SizedBox(height: 32),
                    _FooterServices(),
                    SizedBox(height: 32),
                    _FooterContact(),
                  ],

                  const SizedBox(height: 50),
                  const Divider(color: Colors.white24),
                  const SizedBox(height: 20),
                  const SelectableText(
                    '© 2025 Appdevix. All rights reserved.',
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _FooterCompanyInfo extends StatelessWidget {
  const _FooterCompanyInfo();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            StringConstants.appName,
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 14),
          SelectableText(
            'We build scalable mobile and web products for startups and growing businesses.',
            style: TextStyle(color: Colors.white70, height: 1.6),
          ),
        ],
      ),
    );
  }
}

class _FooterLinks extends StatelessWidget {
  const _FooterLinks();

  @override
  Widget build(BuildContext context) {
    return const _FooterColumn(title: 'Quick Links', items: ['Home', 'Services', 'Features', 'Works', 'Blog']);
  }
}

class _FooterServices extends StatelessWidget {
  const _FooterServices();

  @override
  Widget build(BuildContext context) {
    return const _FooterColumn(
      title: 'Services',
      items: ['Mobile App Development', 'Backend & APIs', 'Web Development', 'MVP for Startups', 'UI/UX Design'],
    );
  }
}

class _FooterContact extends StatelessWidget {
  const _FooterContact();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            'Contact',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 14),
          SelectableText('test@dummy.com', style: TextStyle(color: Colors.white70)),
          SizedBox(height: 10),
          SelectableText('+91 9455122458', style: TextStyle(color: Colors.white70)),
          SizedBox(height: 10),
          SelectableText('India • Working Globally', style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const _FooterColumn({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 14),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SelectableText(item, style: const TextStyle(color: Colors.white70, fontSize: 14)),
            ),
          ),
        ],
      ),
    );
  }
}
