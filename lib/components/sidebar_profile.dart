import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:dev_icons/src/dev_icon_data.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:portfolio_barao/components/icon_and_text.dart';
import 'package:portfolio_barao/components/tools_tile.dart';
import 'package:portfolio_barao/helpers/firebase_setup.dart';
import 'package:portfolio_barao/models/user.dart';

class SidebarProfile extends StatelessWidget {
  const SidebarProfile({super.key, required this.userData, required this.userPhotoUrl});

  final User userData;
  final String userPhotoUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  userPhotoUrl,
                  scale: 1.0,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                userData.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                userData.title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              Divider(),
              const SizedBox(height: 16),
              IconAndText(icon: Icons.email, text: userData.email),
              IconAndText(icon: Icons.phone, text: userData.phoneNumber),
              IconAndText(icon: Icons.location_on, text: userData.location),
              IconAndText(
                  icon: Icons.perm_contact_calendar_sharp,
                  text: userData.age.toString() + ' years old'),

              SizedBox(
                height: 16,
              ),
              Divider(),
              const SizedBox(height: 16),
              Text(
                'Skills',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: userData.mainTools!.map((tool) {
                  return ToolsTile(
                    icon: tool.icon,
                    text: tool.name,
                    iconColor: Colors.white,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
