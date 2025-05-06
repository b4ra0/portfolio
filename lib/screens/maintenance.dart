import 'package:flutter/material.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maintenance'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.work,
              size: 50,
            ),
            SizedBox(width: 10),
            Text(
              'The app is currently under maintenance.',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
