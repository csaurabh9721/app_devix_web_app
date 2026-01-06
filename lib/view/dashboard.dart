import 'package:app_devix/view/work_section.dart';
import 'package:flutter/material.dart';

import '../controller/mian_controller.dart';
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

  void _onScroll() {
    final offset = _mianController.scrollController.offset;
    final value = (1 - offset / 120).clamp(0.0, 1.0);
    _mianController.progress.value = value;
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

            child: SingleChildScrollView(
              controller: _mianController.scrollController,
              child: Column(
                children: [
                  SizedBox(key: _mianController.homeKey, child: Home()),
                  SizedBox(key: _mianController.servicesKey, child: ServicesSection()),
                  SizedBox(key: _mianController.featuresKey, child: FeaturesSection()),
                  SizedBox(key: _mianController.worksKey, child: WorkSection()),
                  SizedBox(key: _mianController.blogKey, child: BlogSection()),
                  SizedBox(key: _mianController.contactKey, child: ContactSection()),
                  FooterSection(),
                ],
              ),
            ),
          ),
          AppHeader(mianController: _mianController),
        ],
      ),
    );
  }
}
