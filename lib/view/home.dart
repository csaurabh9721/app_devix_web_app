import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_devix/utiles/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 80 : 160,
        horizontal: isMobile ? 16 : 48,
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
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// LEFT CONTENT
              Flexible(
                flex: 6,
                child: Column(
                  crossAxisAlignment: isMobile
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Launch Your Digital Vision',
                      textAlign:
                      isMobile ? TextAlign.center : TextAlign.left,
                      style: GoogleFonts.poppins(
                        color: Colors.white70,
                        fontSize: isMobile ? 16 : 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Building Stunning Web & Mobile Experiences',
                      textAlign:
                      isMobile ? TextAlign.center : TextAlign.left,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: isMobile ? 34 : 50,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Our team helps startups and enterprises turn ideas into engaging, scalable products that delight users and drive growth.',
                      textAlign:
                      isMobile ? TextAlign.center : TextAlign.left,
                      style: GoogleFonts.poppins(
                        color: Colors.white70,
                        fontSize: isMobile ? 16 : 20,
                        height: 1.7,
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),

              if (!isMobile) const SizedBox(width: 60),

              /// RIGHT VISUAL
              Flexible(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.only(top: isMobile ? 40 : 0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Soft glow circle
                      Positioned(
                        top: -40,
                        right: -40,
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                Colors.white.withOpacity(0.15),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -60,
                        left: -50,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                Colors.white.withOpacity(0.12),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Main visual
                      Container(
                        height: isMobile ? 250 : 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Colors.white.withOpacity(0.08),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.2)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.15),
                              blurRadius: 40,
                              spreadRadius: 5,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.rocket_launch_outlined,
                            size: 120,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
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
