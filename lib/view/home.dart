import 'package:app_devix/utiles/colors.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.secondaryColor,
            AppColors.primaryColor,
          ],
        ),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Column(
          children: const [
             SizedBox(height: 80,),
            SelectableText(
              'We Build Scalable Digital Products',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(height: 20),
            SelectableText(
              'Helping startups and businesses design, build, and scale modern mobile and web solutions.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                height: 1.6,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
