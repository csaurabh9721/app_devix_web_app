import 'package:app_devix/view/work_section.dart';
import 'package:flutter/material.dart';

import '../controller/mian_controller.dart';
import 'about_section.dart';
import 'blog_section.dart';
import 'contact_section.dart';
import 'feature_section.dart';
import 'footer.dart';
import 'header.dart';
import 'home.dart';
import 'services.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final MianController _mianController = MianController();

  @override
  void initState() {
    super.initState();
    _mianController.scrollController.addListener(_onScroll);
  }

  double _lastOffset = 0;

  void _onScroll() {
    final offset = _mianController.scrollController.offset;

    if ((offset - _lastOffset).abs() < 8) return;

    _lastOffset = offset;
    _mianController.progress.value = (1 - offset / 120).clamp(0.0, 1.0);
  }

  @override
  void dispose() {
    _mianController.scrollController.dispose();
    _mianController.progress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: size.height,
            width: size.width,

            child: CustomScrollView(
              controller: _mianController.scrollController,
              slivers: [
                SliverToBoxAdapter(key: _mianController.homeKey, child: Home()),
                SliverToBoxAdapter(
                  key: _mianController.servicesKey,
                  child: ServicesSection(),
                ),
                SliverToBoxAdapter(
                  key: _mianController.featuresKey,
                  child: FeaturesSection(),
                ),
                SliverToBoxAdapter(
                  key: _mianController.worksKey,
                  child: WorkSection(),
                ),
                SliverToBoxAdapter(
                  key: _mianController.aboutUs,
                  child: AboutSection(),
                ),
                SliverToBoxAdapter(
                  key: _mianController.blogKey,
                  child: BlogSection(),
                ),
                SliverToBoxAdapter(
                  key: _mianController.contactKey,
                  child: ContactSection(),
                ),
                SliverToBoxAdapter(child: FooterSection()),
              ],
            ),
          ),
          AppHeader(mianController: _mianController),
        ],
      ),
    );
  }
}
