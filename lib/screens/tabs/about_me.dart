import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_barao/components/section_title.dart';
import 'package:portfolio_barao/models/user.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        children: [
          SectionTitle(),
          SizedBox(height: 16),
          SelectableText(
            user.aboutMe??'',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
