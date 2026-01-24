import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

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
          style: TextStyle(fontSize: 16.5, height: 1.8, color: Colors.black54),
        ),
        SizedBox(height: 28),
        Text(
          '✔ Fast response\n'
          '✔ Clear communication\n'
          '✔ Scalable solutions',
          style: TextStyle(fontSize: 15.5, height: 1.8, color: Colors.black87),
        ),
      ],
    );
  }
}

class _ContactForm extends StatefulWidget {
  const _ContactForm();

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final ValueNotifier<bool> _isLoading =  ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Field(label: 'Your Name', controller: _nameController),
          const SizedBox(height: 18),
          _Field(label: 'Your Mobile', controller: _phoneController),
          const SizedBox(height: 18),
          _Field(
            label: 'Email Address',
            controller: _emailController,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return 'This field is required';
              }
              if (!v.contains('@')) {
                return 'Invalid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 18),
          _Field(
            label: 'Project Type (Web / Mobile / Other)',
            controller: _subjectController,
          ),
          const SizedBox(height: 18),
          _Field(
            label: 'Tell us about your project',
            maxLines: 5,
            controller: _messageController,
          ),
          const SizedBox(height: 30),

          /// CTA
          ValueListenableBuilder(
            valueListenable: _isLoading,
            builder: (context, value, child) {
              if (value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onSave,
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
              );
            }
          ),
        ],
      ),
    );
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      _callApi();
    }
  }

  Future<void> _callApi() async {
    try {
      _isLoading.value = true;
      Uri url = Uri.parse(
        'https://app-devix-backend.onrender.com/api/contact/request',
      );
      Map<String, String> headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {
        "name": _nameController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "subject": _subjectController.text,
        "message": _messageController.text,
      };
      if (kDebugMode) {
        print(body);
      }

      http.Response response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );
      if (kDebugMode) {
        print(response.body);
      }
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color(0xFF2E7D32),
            content: Text(
              'Message sent successfully! We will get back to you soon.',
            ),
          ),
        );
      } else {
        throw Exception('Failed to send form');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xFFC62828),
          content: Text('Failed to send message. Please try again later.'),
        ),
      );
    }finally {
      _isLoading.value = false;
    }
  }
}

class _Field extends StatelessWidget {
  final String label;
  final int maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const _Field({
    required this.label,
    this.maxLines = 1,
    required this.controller,
    this.validator,
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
        TextFormField(
          validator:
              label == 'Tell us about your project' || label == 'Your Mobile'
              ? null
              : validator ??
                    (v) {
                      if (v == null || v.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
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
