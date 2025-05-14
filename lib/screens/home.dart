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
    return Scaffold(
      body: Center(
        child: FutureBuilder<User>(
          future: loadUser('0vRZpWJr1X7EGXIPzvW2'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Error loading data'));
            }
            if (!snapshot.hasData) {
              return const Center(child: Text('User not found'));
            }
            final userData = snapshot.data!;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SidebarProfile(
                  userData: userData,
                  userPhotoUrl: userData.photoUrl ?? '',
                ),
                SizedBox(
                  width: 10,
                ),
                ContentCard(userData: userData),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<User> loadUser(String userId) async {
    final doc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
    final url = await KiwiContainer()
        .resolve<FirebaseConfig>('firebaseConfig')
        .firebaseStorage
        .ref('/user_photos/$userId.JPG')
        .getDownloadURL();

    return await User.fromJson(doc.data()!, photoUrl: url);
  }
}
