import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Card(
      child: Container(
        width: screenSize.width - 350,
        height: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(),
        ),
        child: const Center(
          child: Text(
            'Home Screen',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
