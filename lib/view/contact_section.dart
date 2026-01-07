import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              const Text(
                'Get in Touch',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Have a project in mind or want to discuss an idea?\nWe’d love to hear from you.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 60),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 700;

                  return Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Info
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: isMobile ? 0 : 40,
                            bottom: isMobile ? 40 : 0,
                          ),
                          child: const ContactInfo(),
                        ),
                      ),

                      // Right Form
                      Expanded(
                        child: ContactForm(),
                      ),
                    ],
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
class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Let’s build something great together',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Whether you’re a startup or an established business, '
              'Appdevix helps you turn ideas into scalable digital products.',
          style: TextStyle(
            fontSize: 15,
            height: 1.6,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 24),
        ContactRow(
          icon: Icons.email,
          text: 'test@dummy.com',
        ),
        SizedBox(height: 12),
        ContactRow(
          icon: Icons.phone,
          text: '+91 XXXXX XXXXX',
        ),
        SizedBox(height: 12),
        ContactRow(
          icon: Icons.location_on,
          text: 'India • Working Globally',
        ),
      ],
    );
  }
}

class ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.indigo),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
class ContactForm extends StatelessWidget {
  ContactForm({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _InputField(
            hint: 'Your Name',
            icon: Icons.person,
          ),
          const SizedBox(height: 16),
          _InputField(
            hint: 'Email Address',
            icon: Icons.email,
          ),
          const SizedBox(height: 16),
          _InputField(
            hint: 'Your Message',
            maxLines: 4,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Send Message',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class _InputField extends StatelessWidget {
  final String hint;
   final IconData? icon;
  final int maxLines;

  const _InputField({
    required this.hint,
     this.icon,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon == null ? null : Icon(icon),
        filled: true,
        fillColor: Colors.grey.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}
