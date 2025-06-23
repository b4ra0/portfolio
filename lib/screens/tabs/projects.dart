import 'package:flutter/material.dart';
import 'package:portfolio_barao/components/section_base.dart';
import 'package:portfolio_barao/models/user.dart';

class Projects extends StatelessWidget {
  const Projects({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return SectionBase(
      widgets: [],
      title: 'Projetos',
    );
  }
}
