import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 70 : 110,
        horizontal: isMobile ? 16 : 24,
      ),
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _ContactIntro(),
              SizedBox(height: 40),
              _ContactForm(),
            ],
          )
              : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(flex: 5, child: _ContactIntro()),
              SizedBox(width: 60),
              Expanded(flex: 6, child: _ContactForm()),
            ],
          ),
        ),
      ),
    );
  }
}
class _ContactIntro extends StatelessWidget {
  const _ContactIntro();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'CONTACT',
          style: TextStyle(
            fontSize: 13,
            letterSpacing: 2,
            fontWeight: FontWeight.w700,
            color: Colors.indigo,
          ),
        ),
        SizedBox(height: 14),
        Text(
          'Let’s build something great together',
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.w800,
            height: 1.2,
          ),
        ),
        SizedBox(height: 18),
        Text(
          'Have an idea, a project, or just want to talk tech?\n'
              'We’d love to hear from you. Tell us about your goals and we’ll help you shape the solution.',
          style: TextStyle(
            fontSize: 16.5,
            height: 1.8,
            color: Colors.black54,
          ),
        ),
        SizedBox(height: 28),
        Text(
          '✔ Fast response\n'
              '✔ Clear communication\n'
              '✔ Scalable solutions',
          style: TextStyle(
            fontSize: 15.5,
            height: 1.8,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
class _ContactForm extends StatelessWidget {
  const _ContactForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Field(label: 'Your Name'),
        const SizedBox(height: 18),
        _Field(label: 'Email Address'),
        const SizedBox(height: 18),
        _Field(label: 'Project Type (Web / Mobile / Other)'),
        const SizedBox(height: 18),
        _Field(
          label: 'Tell us about your project',
          maxLines: 5,
        ),
        const SizedBox(height: 30),

        /// CTA
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              //https://app-devix-backend.onrender.com/api/contact/request
            //   {
            //     "name": "Test User1",
            //   "email": "csaurabh002@gmail.com",
            //   "phone": "9455122458",
            //   "subject": "Live Testing",
            //   "message": "Test by live"
            // }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Send Message',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
class _Field extends StatelessWidget {
  final String label;
  final int maxLines;

  const _Field({
    required this.label,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.indigo),
            ),
          ),
        ),
      ],
    );
  }
}
