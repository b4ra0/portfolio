import 'package:flutter/material.dart';
import 'package:portfolio_barao/components/section_title.dart';

class SectionBase extends StatelessWidget {
  const SectionBase({super.key, required this.widgets, required this.title});

  final List<Widget> widgets;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SectionTitle(title: title),
        SizedBox(height: 16),
        ...widgets,
        ],
      ),
    );
  }
}
