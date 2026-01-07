import 'package:flutter/material.dart';

class BlogSection extends StatelessWidget {
  BlogSection({super.key});

  final List<BlogPost> posts = [
    BlogPost(
      title: 'How Flutter Web Performs in Real Production',
      excerpt:
          'A deep dive into performance tuning, rendering behavior, and best practices for Flutter Web apps.',
      date: 'Sep 12, 2025',
      readTime: '6 min read',
    ),
    BlogPost(
      title: 'Clean Architecture for Scalable Flutter Apps',
      excerpt:
          'Learn how to structure Flutter apps that scale gracefully with growing teams.',
      date: 'Aug 25, 2025',
      readTime: '8 min read',
    ),
    BlogPost(
      title: 'Optimizing Flutter Animations for Web',
      excerpt:
          'How to avoid jank, improve FPS, and use GPU-friendly animations.',
      date: 'Aug 02, 2025',
      readTime: '5 min read',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 30 : 50,
        horizontal: isMobile ? 16 : 24,
      ),
      color: const Color(0xFFF9FAFC),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'INSIGHTS',
                    style: TextStyle(
                      fontSize: 13,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Latest from our blog',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Thoughts, tutorials, and insights on Flutter, architecture, and building scalable products.',
                    style: TextStyle(
                      fontSize: 16.5,
                      height: 1.8,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),

              SizedBox(height: isMobile ? 40 : 60),

              isMobile
                  ? _MobileBlogList(posts: posts)
                  : _DesktopBlogLayout(posts: posts),

              const SizedBox(height: 50),

              /// CTA
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.indigo,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: const Text('Read all articles →'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DesktopBlogLayout extends StatelessWidget {
  final List<BlogPost> posts;

  const _DesktopBlogLayout({required this.posts});

  @override
  Widget build(BuildContext context) {
    final featured = posts.first;
    final others = posts.skip(1).toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Featured Post
        Expanded(flex: 5, child: _FeaturedPost(post: featured)),
        const SizedBox(width: 40),

        /// List
        Expanded(
          flex: 4,
          child: Column(
            children: others.map((post) => _BlogListItem(post: post)).toList(),
          ),
        ),
      ],
    );
  }
}

class _MobileBlogList extends StatelessWidget {
  final List<BlogPost> posts;

  const _MobileBlogList({required this.posts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: posts.map((post) => _BlogListItem(post: post)).toList(),
    );
  }
}

class _FeaturedPost extends StatelessWidget {
  final BlogPost post;

  const _FeaturedPost({required this.post});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.08),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(
                "https://strapi.dhiwise.com/uploads/Flutter_Web_examples_OG_Image_c02978694b.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            post.title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            post.excerpt,
            style: const TextStyle(
              fontSize: 16,
              height: 1.8,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 14),
          _Meta(post: post),
        ],
      ),
    );
  }
}

class _BlogListItem extends StatelessWidget {
  final BlogPost post;

  const _BlogListItem({required this.post});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            Text(
              post.excerpt,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14.5,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            _Meta(post: post),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }
}

class _Meta extends StatelessWidget {
  final BlogPost post;

  const _Meta({required this.post});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${post.date} · ${post.readTime}',
      style: const TextStyle(fontSize: 13, color: Colors.black54),
    );
  }
}

class BlogPost {
  final String title;
  final String excerpt;
  final String date;
  final String readTime;

  BlogPost({
    required this.title,
    required this.excerpt,
    required this.date,
    required this.readTime,
  });
}
