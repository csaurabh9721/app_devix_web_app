import 'package:flutter/material.dart';

class ServiceItem {
  final IconData icon;
  final String title;
  final String desc;

  const ServiceItem({required this.icon, required this.title, required this.desc});
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  static final List<ServiceItem> services = [
    ServiceItem(
      icon: Icons.phone_iphone,
      title: 'Mobile App Development',
      desc: 'High-performance Flutter & Native Android apps with clean architecture and great UX.',
    ),
    ServiceItem(
      icon: Icons.cloud,
      title: 'Backend & API Development',
      desc: 'Secure, scalable backend systems using Spring Boot and .NET.',
    ),
    ServiceItem(
      icon: Icons.web,
      title: 'Web Application Development',
      desc: 'Modern, responsive web applications built with Angular and React.',
    ),
    ServiceItem(
      icon: Icons.rocket_launch,
      title: 'MVP for Startups',
      desc: 'Rapid MVP development to validate ideas and launch faster.',
    ),
    ServiceItem(
      icon: Icons.settings,
      title: 'App Maintenance & Scaling',
      desc: 'Ongoing support, performance optimization, and scaling.',
    ),
    ServiceItem(
      icon: Icons.design_services,
      title: 'UI/UX & Product Design',
      desc: 'User-focused design that delivers clean and engaging experiences.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 24),
      color: Colors.grey.shade100,
      child: Column(
        children: [
          SelectableText('What We Do at Appdevix', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 14),
          const SelectableText(
            'End-to-end product development services for startups and growing businesses.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 56),

          /// IMPORTANT: Width Constraint
          LayoutBuilder(
            builder: (context, constraints) {
              int columns = 3;

              if (constraints.maxWidth < 1100) columns = 2;
              if (constraints.maxWidth < 700) columns = 1;

              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: services.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 32,
                      mainAxisSpacing: 32,
                      childAspectRatio: 1.25, // ⭐ KEY FIX
                    ),
                    itemBuilder: (context, index) {
                      return ServiceCard(item: services[index]);
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatefulWidget {
  final ServiceItem item;

  const ServiceCard({super.key, required this.item});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? Colors.black.withValues(alpha: 0.3)
                  : Colors.black.withValues(alpha: 0.02),
              blurRadius: isHovered ? 6 : 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isHovered
                    ? Colors.indigo
                    : Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(
                widget.item.icon,
                color: isHovered ? Colors.white : Colors.indigo,
              ),
            ),
            const SizedBox(height: 22),
            SelectableText(
              widget.item.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            SelectableText(
              widget.item.desc,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
