import 'package:flutter/material.dart';

class WorkSection extends StatelessWidget {
  WorkSection({super.key});

  final List<WorkItem> works = [
    WorkItem(
      title: 'Fintech Mobile App',
      desc: 'A secure and scalable fintech app with real-time transactions and analytics.',
      image: 'https://cdn.corporatefinanceinstitute.com/assets/careers-in-fintech.jpeg',
      tags: ['Flutter', 'SpringBoot', 'Live-Data'],
    ),
    WorkItem(
      title: 'E-Commerce Platform',
      desc: 'High-performance shopping platform with smooth UX and payment integration.',
      image: 'https://raw.githubusercontent.com/ziddahedem/LC09-ecommerce-website/master/images/lc09-ecommerce%20website.jpg',
      tags: ['Angular', 'SpringBoot', 'MySQL'],
    ),
    WorkItem(
      title: 'Healthcare Dashboard',
      desc: 'Data-driven admin dashboard for hospitals and clinics.',
      image: 'https://s3-alpha.figma.com/hub/file/5382060381/182556ae-d6dd-4f11-9bbd-fb6236d8de91-cover.png',
      tags: ['React', '.Net', 'PostgreSQL'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: isMobile ? 16 : 24,
      ),
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              /// Header
              Column(
                children: const [
                  Text(
                    'OUR WORK',
                    style: TextStyle(
                      fontSize: 13,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Projects we’re proud of',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 18),
                  Text(
                    'We help startups and enterprises turn complex problems into elegant digital products.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.5,
                      height: 1.8,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),

              SizedBox(height: isMobile ? 40 : 70),

              /// Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth;
                  int columns = 3;

                  if (maxWidth < 900) columns = 2;
                  if (maxWidth < 600) columns = 1;

                  final cardWidth =
                      (maxWidth - ((columns - 1) * 30)) / columns;

                  return Wrap(
                    spacing: 30,
                    runSpacing: 30,
                    children: works.map(
                          (item) {
                        return SizedBox(
                          width: cardWidth,
                          child: WorkCard(item: item),
                        );
                      },
                    ).toList(),
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
class WorkCard extends StatefulWidget {
  final WorkItem item;

  const WorkCard({super.key, required this.item});

  @override
  State<WorkCard> createState() => _WorkCardState();
}

class _WorkCardState extends State<WorkCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final enableHover = MediaQuery.of(context).size.width > 900;

    return MouseRegion(
      onEnter: enableHover ? (_) => setState(() => isHovered = true) : null,
      onExit: enableHover ? (_) => setState(() => isHovered = false) : null,
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 220),
        tween: Tween(begin: 0, end: isHovered ? 1 : 0),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(0, -8 * value),
            child: child,
          );
        },
        child: _WorkCardContent(
          item: widget.item,
          isHovered: isHovered,
        ),
      ),
    );
  }
}
class _WorkCardContent extends StatelessWidget {
  final WorkItem item;
  final bool isHovered;

  const _WorkCardContent({
    required this.item,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isHovered ? 0.12 : 0.06),
            blurRadius: isHovered ? 18 : 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          AspectRatio(
            aspectRatio: 16 / 10,
            child: Image.network(item.image,fit: BoxFit.fill,),
          ),

          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  item.desc,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),

                /// Tags
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: item.tags.map(
                        (tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.indigo.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.indigo,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),

                const SizedBox(height: 20),

                /// CTA
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.indigo,
                  ),
                  child: const Text(
                    'View Case Study →',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class WorkItem {
  final String title;
  final String desc;
  final String image;
  final List<String> tags;

  WorkItem({
    required this.title,
    required this.desc,
    required this.image,
    required this.tags,
  });
}
