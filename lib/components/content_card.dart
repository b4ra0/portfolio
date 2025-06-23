import 'package:flutter/material.dart';
import 'package:portfolio_barao/models/user.dart';
import 'package:portfolio_barao/screens/tabs/about_me.dart';
import 'package:portfolio_barao/screens/tabs/academic_experiences.dart';
import 'package:portfolio_barao/screens/tabs/professional_experiences.dart';
import 'package:portfolio_barao/screens/tabs/projects.dart';

class ContentCard extends StatefulWidget {
  ContentCard({super.key, required this.userData});

  late TabController tabController;
  final User userData;

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    widget.tabController = TabController(length: 4, vsync: this);
    widget.tabController.addListener(() => setState(() {}));
    super.initState();
  }
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
        child: Column(
          children: [
            TabBar(
              controller: widget.tabController,
              tabs: [
                Tab(text: 'About me'),
                Tab(text: 'Academic experiences'),
                Tab(text: 'Professional experiences'),
                Tab(text: 'Projects'),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                controller: widget.tabController,
                children: [
                  AboutMe(user: widget.userData),
                  AcademicExperiences(user: widget.userData),
                  ProfessionalExperiences(user: widget.userData),
                  Projects(user: widget.userData),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
