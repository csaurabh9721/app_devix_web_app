import 'package:app_devix/view/work_section.dart';
import 'package:flutter/material.dart';

import 'blog_section.dart';
import 'contact_section.dart';
import 'feature_section.dart';
import 'footer.dart';
import 'header.dart';
import 'home.dart';
import 'services.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectionArea(
        child: CustomScrollView(
          slivers: [
            AppHeader(),
            SliverToBoxAdapter(child: Home()),
            SliverToBoxAdapter(child: ServicesSection()),
            SliverToBoxAdapter(child: FeaturesSection()),
            SliverToBoxAdapter(child: WorkSection()),
            SliverToBoxAdapter(child: BlogSection()),
            SliverToBoxAdapter(child: ContactSection()),
            SliverToBoxAdapter(child: FooterSection()),
          ],
        ),
      ),
    );
  }
}
