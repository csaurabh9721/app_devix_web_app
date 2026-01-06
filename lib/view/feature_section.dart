import 'package:flutter/material.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  static final List<FeatureItem> features = [
    FeatureItem(
      icon: Icons.architecture,
      title: 'Clean & Scalable Architecture',
      desc:
      'We follow clean architecture principles to ensure your product is scalable, maintainable, and future-ready.',
    ),
    FeatureItem(
      icon: Icons.speed,
      title: 'Performance First',
      desc:
      'Optimized code and best practices to deliver fast, smooth, and reliable user experiences.',
    ),
    FeatureItem(
      icon: Icons.groups,
      title: 'Startup-Focused Approach',
      desc:
      'We understand startup challenges and build products that grow with your business.',
    ),
    FeatureItem(
      icon: Icons.security,
      title: 'Secure by Design',
      desc:
      'Security best practices are integrated from day one to protect your data and users.',
    ),
    FeatureItem(
      icon: Icons.sync_alt,
      title: 'Agile & Transparent Process',
      desc:
      'Clear communication, regular updates, and agile execution throughout the project.',
    ),
    FeatureItem(
      icon: Icons.support_agent,
      title: 'Long-Term Support',
      desc:
      'We don’t just deliver projects—we build long-term partnerships with ongoing support.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              const SelectableText(
                'Why Choose Appdevix',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              const SelectableText(
                'We focus on quality, scalability, and long-term success—not just delivery.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 60),

              LayoutBuilder(
                builder: (context, constraints) {
                  int columns = 3;
                  if (constraints.maxWidth < 1000) columns = 2;
                  if (constraints.maxWidth < 650) columns = 1;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: features.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 32,
                      mainAxisSpacing: 32,
                      childAspectRatio: 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return FeatureCard(item: features[index]);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class FeatureCard extends StatelessWidget {
  final FeatureItem item;

  const FeatureCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(item.icon, color: Colors.indigo),
          ),
          const SizedBox(height: 22),
          SelectableText(
            item.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          SelectableText(
            item.desc,
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}


class FeatureItem {
  final IconData icon;
  final String title;
  final String desc;

  const FeatureItem({
    required this.icon,
    required this.title,
    required this.desc,
  });
}