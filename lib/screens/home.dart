import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:portfolio_barao/helpers/firebase_setup.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final firebaseFirestore = KiwiContainer()
        .resolve<FirebaseConfig>('firebaseConfig')
        .firebaseFirestore;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      body: Center(
          child: Card(
        elevation: 10,
        child: Container(
            height: screenSize.height * 0.9,
            width: screenSize.width * 0.8,
            child: FutureBuilder<DocumentSnapshot>(
              future: users.doc('0vRZpWJr1X7EGXIPzvW2').get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Row(
                  children: [
                    Container(
                      height: double.infinity,
                      width: 300,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        borderRadius: BorderRadius.only(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                'https://example.com/profile.jpg',
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Name Surname',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Software Engineer',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      width: screenSize.width * 0.8 - 300,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(),
                      ),
                      child: const Center(
                        child: Text(
                          'Home Screen',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    )
                  ],
                );
              }
            )),
      )),
    );
  }
}
