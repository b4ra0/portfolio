import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:portfolio_barao/components/content_card.dart';
import 'package:portfolio_barao/components/sidebar_profile.dart';
import 'package:portfolio_barao/helpers/firebase_setup.dart';
import 'package:portfolio_barao/models/user.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseFirestore = KiwiContainer()
        .resolve<FirebaseConfig>('firebaseConfig')
        .firebaseFirestore;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      body: Center(
        child: FutureBuilder<DocumentSnapshot>(
          future: users.doc('0vRZpWJr1X7EGXIPzvW2').get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Error loading data'));
            }
            if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Center(child: Text('User not found'));
            }
            final userData =
                User.fromJson(snapshot.data!.data() as Map<String, dynamic>);
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SidebarProfile(
                  userData: userData,
                ),
                SizedBox(
                  width: 10,
                ),
                ContentCard(),
              ],
            );
          },
        ),
      ),
    );
  }
}
