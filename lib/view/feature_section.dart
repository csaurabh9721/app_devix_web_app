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
                  Text(
                    'Built for ambition. Engineered for growth.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 18),
                  Text(
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

              /// Feature Cards
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
    final isMobile = MediaQuery.of(context).size.width < 900;
    final enableHover = !isMobile;

    return MouseRegion(
      onEnter: enableHover ? (_) => setState(() => isHovered = true) : null,
      onExit: enableHover ? (_) => setState(() => isHovered = false) : null,
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 220),
        tween: Tween(begin: 0, end: isHovered ? 1 : 0),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(0, -6 * value),
            child: child,
          );
        },
        child: _FeatureCardContent(
          item: widget.item,
          isHovered: isHovered,
        ),
      ),
    );
  }
}
class _FeatureCardContent extends StatelessWidget {
  final FeatureItem item;
  final bool isHovered;

  const _FeatureCardContent({
    required this.item,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.withOpacity(isHovered ? 0.18 : 0.08),
            blurRadius: isHovered ? 16 : 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Icon Row
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.indigo.withOpacity(0.08),
                ),
                child: Icon(
                  item.icon,
                  color: Colors.indigo,
                  size: 28,
                ),
              ),
              const SizedBox(width: 22),
              Expanded(
                child: Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            item.desc,
            style: const TextStyle(
              fontSize: 15.5,
              height: 1.8,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
