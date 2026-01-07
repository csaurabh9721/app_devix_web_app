import 'package:flutter/material.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  static final List<BlogItem> blogs = [
    BlogItem(
      category: 'App Development',
      title: 'How to Build a Scalable Mobile App from Day One',
      excerpt:
      'Key architectural and development practices every startup should follow when building a mobile app.',
      readTime: '5 min read',
    ),
    BlogItem(
      category: 'Startups',
      title: 'MVP Development: What to Build and What to Skip',
      excerpt:
      'A practical guide for startups to launch faster without wasting time and budget.',
      readTime: '4 min read',
    ),
    BlogItem(
      category: 'Engineering',
      title: 'Why Clean Architecture Matters for Long-Term Growth',
      excerpt:
      'Understanding how clean architecture helps scale products and teams efficiently.',
      readTime: '6 min read',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 100, 24, 0),
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              const Text(
                'From Our Blog',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Insights, experiences, and best practices from our team.',
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
                    itemCount: blogs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 32,
                      mainAxisSpacing: 32,
                      childAspectRatio: 1.25,
                    ),
                    itemBuilder: (context, index) {
                      return BlogCard(item: blogs[index]);
                    },
                  );
                },
              ),

              const SizedBox(height: 50),

              TextButton(
                onPressed: () {},
                child: const Text(
                  'View All Articles →',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class BlogCard extends StatelessWidget {
  final BlogItem item;

  const BlogCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.category.toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            item.excerpt,
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          const SizedBox(height: 20),
          Text(
            item.readTime,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

class BlogItem {
  final String title;
  final String excerpt;
  final String category;
  final String readTime;

  const BlogItem({
    required this.title,
    required this.excerpt,
    required this.category,
    required this.readTime,
  });
}