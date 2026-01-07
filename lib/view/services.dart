import 'package:flutter/material.dart';

import '../data/service_data.dart';

class ServicesSection extends StatelessWidget {
  ServicesSection({super.key});

  final ServiceData _serviceData = ServiceData();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 700;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 70 : 110,
        horizontal: isMobile ? 16 : 24,
      ),
      color: const Color(0xFFF8F9FB),
      child: Column(
        children: [
          /// Section Label
          Text(
            'OUR SERVICES',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
              color: Colors.indigo.shade500,
            ),
          ),
          const SizedBox(height: 12),

          /// Title
          SelectableText(
            'What We Do at Appdevix',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 26 : 36,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),

          /// Subtitle
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: SelectableText(
              'From idea to launch, we deliver scalable digital products for startups and growing businesses.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                height: 1.6,
                color: Colors.black54,
              ),
            ),
          ),

          SizedBox(height: isMobile ? 48 : 70),

          /// Cards
          LayoutBuilder(
            builder: (context, constraints) {
              final maxWidth = constraints.maxWidth;
              double cardWidth;

              if (maxWidth >= 1200) {
                cardWidth = 380;
              } else if (maxWidth >= 700) {
                cardWidth = maxWidth / 2 - 24;
              } else {
                cardWidth = maxWidth;
              }

              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: _serviceData.services.map((service) {
                      return SizedBox(
                        width: cardWidth,
                        child: ServiceCard(item: service),
                      );
                    }).toList(),
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
    final isMobile = MediaQuery.of(context).size.width < 700;
    final enableHover = !isMobile;
    final color = widget.item.accentColor;

    return MouseRegion(
      onEnter: enableHover ? (_) => setState(() => isHovered = true) : null,
      onExit: enableHover ? (_) => setState(() => isHovered = false) : null,
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: isHovered
            ? (Matrix4.identity()..translate(0.0, -6.0))
            : Matrix4.identity(),
        padding: EdgeInsets.all(isMobile ? 22 : 28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isHovered ? color.withValues(alpha: 0.25) : Colors.transparent,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: isHovered ? 0.18 : 0.06),
              blurRadius: isHovered ? 24 : 12,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Icon
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isHovered
                      ? [color, color.withValues(alpha: 0.85)]
                      : [color.withValues(alpha: 0.15), color.withValues(alpha: 0.05)],
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                widget.item.icon,
                size: 26,
                color: isHovered ? Colors.white : color,
              ),
            ),

            const SizedBox(height: 22),

            /// Title
            SelectableText(
              widget.item.title,
              style: TextStyle(
                fontSize: isMobile ? 17 : 19,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 12),

            /// Description
            SelectableText(
              widget.item.desc,
              style: TextStyle(
                fontSize: isMobile ? 14 : 15,
                height: 1.6,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 16),

            /// Features
            ...widget.item.features.map(
                  (feature) => Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_circle, size: 16, color: color),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SelectableText(
                        feature,
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




