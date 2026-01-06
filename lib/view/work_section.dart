import 'package:flutter/material.dart';

class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

  static final List<WorkItem> works = [
    WorkItem(
      title: 'Startup MVP Platform',
      category: 'Mobile + Backend',
      description:
      'Built a scalable MVP for a startup, covering mobile app, backend APIs, and admin dashboard.',
      tech: ['Flutter', 'Spring Boot', 'MySQL'],
    ),
    WorkItem(
      title: 'Business Management System',
      category: 'Web Application',
      description:
      'Developed a web-based system to manage operations, users, and reports for a growing business.',
      tech: ['Angular', '.NET', 'PostgreSQL'],
    ),
    WorkItem(
      title: 'Service Booking App',
      category: 'Mobile Application',
      description:
      'Designed and developed a mobile app enabling users to book services with real-time updates.',
      tech: ['Flutter', 'Firebase'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      color: Colors.grey.shade50,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              const SelectableText(
                'Our Work',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              const SelectableText(
                'A glimpse of products we’ve built and problems we’ve solved.',
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
                    itemCount: works.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 32,
                      mainAxisSpacing: 32,
                      childAspectRatio: 1.25,
                    ),
                    itemBuilder: (context, index) {
                      return WorkCard(item: works[index]);
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
class WorkCard extends StatelessWidget {
  final WorkItem item;

  const WorkCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SelectableText(
              item.category,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.indigo,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SelectableText(
            item.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          SelectableText(
            item.description,
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: item.tech
                .map(
                  (t) => Chip(
                label: SelectableText(
                  t,
                  style: const TextStyle(fontSize: 12),
                ),
                backgroundColor: Colors.grey.shade100,
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class WorkItem {
  final String title;
  final String category;
  final String description;
  final List<String> tech;

  const WorkItem({
    required this.title,
    required this.category,
    required this.description,
    required this.tech,
  });
}