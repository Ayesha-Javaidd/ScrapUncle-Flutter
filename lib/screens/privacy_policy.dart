import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("Privacy Policy")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Privacy Matters!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green[600],
              ),
            ),
            SizedBox(height: 26),
            Text(
              "We are committed to protecting your personal information:",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 26),
            Text(
              "1. We only collect information necessary for service delivery.",
            ),
            Text(
              "2. Your data is stored securely and not shared with third parties.",
            ),
            Text("3. Location is used to schedule pickups efficiently."),
            Text("4. You can request data deletion at any time."),
            SizedBox(height: 26),
            Text(
              "If you have any privacy concerns, contact support at support@example.com.",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
