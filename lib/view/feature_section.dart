import 'package:flutter/material.dart';

import '../data/feature_data.dart';

class FeaturesSection extends StatelessWidget {
  FeaturesSection({super.key});

  final FeatureData _data = FeatureData();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 45 : 90,
        horizontal: isMobile ? 16 : 24,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.indigo.withOpacity(0.05),
            Colors.white,
            Colors.white,
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              /// Header
              Column(
                children: const [
                  Text(
                    'WHY APPDEVIX',
                    style: TextStyle(
                      fontSize: 13,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 16),
                  SelectableText(
                    'Built for ambition. Engineered for growth.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 18),
                  SelectableText(
                    'We don’t just build software — we create scalable, reliable products that help businesses grow with confidence.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.5,
                      height: 1.8,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),

              SizedBox(height: isMobile ? 30 : 50),

              /// Features Grid (Soft, Premium)
              Wrap(
                spacing: 30,
                runSpacing: 30,
                children: _data.features.map(
                      (feature) {
                    return SizedBox(
                      width: isMobile ? double.infinity : 520,
                      child: FeatureShowcaseItem(item: feature),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





class FeatureShowcaseItem extends StatefulWidget {
  final FeatureItem item;

  const FeatureShowcaseItem({super.key, required this.item});

  @override
  State<FeatureShowcaseItem> createState() => _FeatureShowcaseItemState();
}

class _FeatureShowcaseItemState extends State<FeatureShowcaseItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: isHovered
            ? (Matrix4.identity()..translate(0.0, -6.0))
            : Matrix4.identity(),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.85),
          boxShadow: [
            BoxShadow(
              color: Colors.indigo.withOpacity(isHovered ? 0.25 : 0.12),
              blurRadius: isHovered ? 40 : 25,
              offset: const Offset(0, 18),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Glass Icon
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.indigo.withOpacity(0.35),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Icon(
                    widget.item.icon,
                    color: Colors.indigo,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 22),

                SelectableText(
                  widget.item.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            SelectableText(
              widget.item.desc,
              style: const TextStyle(
                fontSize: 15.5,
                height: 1.8,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




