import 'package:flutter/material.dart';
import 'package:portfolio_barao/components/section_base.dart';
import 'package:portfolio_barao/models/user.dart';

class AcademicExperience extends StatelessWidget {
  const AcademicExperience({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return SectionBase(
      title: 'Experiência Acadêmica',
      widgets: [],
    );
  }
}
