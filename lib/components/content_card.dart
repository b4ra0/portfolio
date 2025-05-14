import 'package:flutter/material.dart';
import 'package:portfolio_barao/models/user.dart';
import 'package:portfolio_barao/screens/tabs/about_me.dart';
import 'package:portfolio_barao/screens/tabs/academic_experience.dart';

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
                Tab(text: 'Academic experience'),
                Tab(text: 'Professional experience'),
                Tab(text: 'Projects'),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                controller: widget.tabController,
                children: [
                  AboutMe(user: widget.userData),
                  AcademicExperience(user: widget.userData),
                  const Center(child: Text('Professional experience')),
                  const Center(child: Text('Projects')),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
