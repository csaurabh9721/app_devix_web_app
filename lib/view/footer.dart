import 'package:flutter/material.dart';

import '../controller/mian_controller.dart';

class FooterSection extends StatelessWidget {
  final MianController controller;

  const FooterSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0B1220),
      padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 800;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TOP CONTENT
                  Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const _FooterCompanyInfo(),

                      if (!isMobile) const SizedBox(width: 40),
                      if (!isMobile)
                        _FooterColumn(
                          title: 'Quick Links',
                          items: ['Home', 'Services', 'Features', 'Works', 'About', 'Blog'],
                          controller: controller,
                        ),

                      if (!isMobile) const SizedBox(width: 40),
                      if (!isMobile)
                        _FooterColumn(
                          title: 'Services',
                          items: [
                            'Mobile App Development',
                            'Backend & APIs',
                            'Web Development',
                            'MVP for Startups',
                            'UI/UX Design',
                          ],
                          controller: controller,
                        ),

                      if (!isMobile) const SizedBox(width: 40),
                      if (!isMobile) const _FooterContact(),
                    ],
                  ),

                  /// MOBILE STACK
                  if (isMobile) ...[
                    SizedBox(height: 40),
                    _FooterColumn(
                      title: 'Quick Links',
                      items: ['Home', 'Services', 'Features', 'Works', 'Blog'],
                      controller: controller,
                    ),
                    SizedBox(height: 32),
                    _FooterColumn(
                      title: 'Services',
                      items: [
                        'Mobile App Development',
                        'Backend & APIs',
                        'Web Development',
                        'MVP for Startups',
                        'UI/UX Design',
                      ],
                      controller: controller,
                    ),
                    SizedBox(height: 32),
                    _FooterContact(),
                  ],

                  const SizedBox(height: 60),
                  const Divider(color: Colors.white12),
                  const SizedBox(height: 22),

                  Center(
                    child: Text(
                      '© 2025 Appdevix. All rights reserved.',
                      style: TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                  ),
                  /// BOTTOM BAR
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: const [
                  //     Text(
                  //       '© 2025 Appdevix. All rights reserved.',
                  //       style: TextStyle(color: Colors.white54, fontSize: 14),
                  //     ),
                  //     _FooterSocials(),
                  //   ],
                  // ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

/// ================= COMPANY INFO =================
class _FooterCompanyInfo extends StatelessWidget {
  const _FooterCompanyInfo();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,

            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Image.asset("assets/AppLogo1.png", fit: BoxFit.fill),
          ),
          const SizedBox(height: 16),
          const Text(
            'We build scalable mobile and web products for startups and growing businesses.',
            style: TextStyle(color: Colors.white70, height: 1.7, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

/// ================= FOOTER COLUMN =================
class _FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;
  final MianController controller;

  const _FooterColumn({required this.title, required this.items, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          ...items.map(
            (item) => InkWell(
              onTap: () {
                if (title == 'Quick Links') {
                  controller.scrollTo(item);
                }
              },
              child: _FooterLink(text: item),
            ),
          ),
        ],
      ),
    );
  }
}

/// ================= FOOTER LINK =================
class _FooterLink extends StatefulWidget {
  final String text;

  const _FooterLink({required this.text});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      cursor: SystemMouseCursors.click,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(widget.text, style: TextStyle(color: hover ? Colors.indigo : Colors.white70, fontSize: 14)),
      ),
    );
  }
}

/// ================= CONTACT =================
class _FooterContact extends StatelessWidget {
  const _FooterContact();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 16),
          Text('hello@appdevix.com', style: TextStyle(color: Colors.white70)),
          SizedBox(height: 10),
          Text('+91 94551 22458', style: TextStyle(color: Colors.white70)),
          SizedBox(height: 10),
          Text('India • Working Globally', style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}

// /// ================= SOCIAL ICONS =================
// class _FooterSocials extends StatelessWidget {
//   const _FooterSocials();
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: const [
//         _SocialIcon(icon: Icons.link),
//         SizedBox(width: 14),
//         _SocialIcon(icon: Icons.code),
//         SizedBox(width: 14),
//         _SocialIcon(icon: Icons.business),
//       ],
//     );
//   }
// }
//
// class _SocialIcon extends StatelessWidget {
//   final IconData icon;
//
//   const _SocialIcon({required this.icon});
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: Icon(icon, color: Colors.white54, size: 20),
//     );
//   }
// }
