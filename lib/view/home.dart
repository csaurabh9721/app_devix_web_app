import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_devix/utiles/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final isMobile = width < 768;
        final isTablet = width >= 768 && width < 1200;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 40 : 80,
            horizontal: isMobile ? 16 : 32,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primaryColor,
                AppColors.secondaryColor,
              ],
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1400),
              child: isMobile
                  ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _ImageSection(width, isMobile, isTablet),
                  const SizedBox(height: 40),
                  _TextSection(isMobile, isTablet),
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: _TextSection(isMobile, isTablet)),
                  const SizedBox(width: 40),
                  _ImageSection(width, isMobile, isTablet),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// ================= TEXT =================
class _TextSection extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;

  const _TextSection(this.isMobile, this.isTablet);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Launch Your Digital Vision',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.lora(
            color: Colors.white70,
            fontSize: isMobile ? 14 : 18,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Building Stunning Web & Mobile Experiences',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.lora(
            color: Colors.white,
            fontSize: isMobile
                ? 30
                : isTablet
                ? 42
                : 52,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "Our team partners with startups and enterprises to design, build, and scale high-quality digital products.\nWe focus on creating reliable, user-centric solutions that are built to grow with your business.",
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.libreBaskerville(
            color: Colors.white70,
            fontSize: isMobile ? 15 : 18,
            height: 1.7,
          ),
        ),
      ],
    );
  }
}

/// ================= IMAGE =================
class _ImageSection extends StatelessWidget {
  final double width;
  final bool isMobile;
  final bool isTablet;

  const _ImageSection(this.width, this.isMobile, this.isTablet);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/banner.png",
      width: isMobile
          ? width * 0.85
          : isTablet
          ? 420
          : 520,
      cacheWidth: 600,
      filterQuality: FilterQuality.low,
      fit: BoxFit.contain,
    );
  }
}
