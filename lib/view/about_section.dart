import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 900;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 70 : 110,
            horizontal: isMobile ? 16 : 24,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.indigo.withOpacity(0.06),
                Colors.white,
              ],
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: isMobile
                  ? const _MobileAbout()
                  : const _DesktopAbout(),
            ),
          ),
        );
      },
    );
  }
}
class _DesktopAbout extends StatelessWidget {
  const _DesktopAbout();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(flex: 6, child: _AboutContent()),
        SizedBox(width: 60),
        Expanded(flex: 5, child: _AboutStats()),
      ],
    );
  }
}
class _MobileAbout extends StatelessWidget {
  const _MobileAbout();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _AboutContent(),
        SizedBox(height: 40),
        _AboutStats(),
      ],
    );
  }
}
class _AboutContent extends StatelessWidget {
  const _AboutContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'ABOUT US',
          style: TextStyle(
            fontSize: 13,
            letterSpacing: 2,
            fontWeight: FontWeight.w700,
            color: Colors.indigo,
          ),
        ),
        SizedBox(height: 14),
        Text(
          'We craft digital products that people love to use.',
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.w800,
            height: 1.2,
          ),
        ),
        SizedBox(height: 18),
        Text(
          'Appdevix is a product-focused development studio helping startups and businesses '
              'turn ideas into scalable, high-quality mobile and web applications.\n\n'
              'We believe great software is not just about clean code — it’s about understanding users, '
              'business goals, and building solutions that grow with time.',
          style: TextStyle(
            fontSize: 16.5,
            height: 1.8,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 26),
        _AboutHighlights(),
      ],
    );
  }
}
class _AboutHighlights extends StatelessWidget {
  const _AboutHighlights();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _HighlightItem(text: '5+ years of real-world development experience'),
        _HighlightItem(text: '15+ successful projects delivered'),
        _HighlightItem(text: 'Clean architecture & scalable systems'),
        _HighlightItem(text: 'Clear communication & long-term support'),
      ],
    );
  }
}

class _HighlightItem extends StatelessWidget {
  final String text;

  const _HighlightItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const  Icon(Icons.check_circle, size: 18, color: Colors.indigo),
          const  SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15.5,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class _AboutStats extends StatelessWidget {
  const _AboutStats();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _StatBox(value: '15+', label: 'Projects Delivered'),
        SizedBox(height: 24),
        _StatBox(value: '5+', label: 'Years Experience'),
        SizedBox(height: 24),
        _StatBox(value: '100%', label: 'Client Satisfaction'),
      ],
    );
  }
}

class _StatBox extends StatelessWidget {
  final String value;
  final String label;

  const _StatBox({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 26),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.indigo.withOpacity(0.2)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
