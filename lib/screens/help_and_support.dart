import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Help & Support")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Need Help?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green[600],
              ),
            ),
            SizedBox(height: 12),
            Text(
              "We’re here to support you with any questions or issues you may have while using the app.",
            ),
            SizedBox(height: 24),
            Text(
              "Frequently Asked Questions",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green[600],
              ),
            ),
            SizedBox(height: 12),
            Text("• How do I schedule a pickup?"),
            Text(
              "   - Go to the Schedule tab and select your preferred date and time.",
            ),
            SizedBox(height: 8),
            Text("• What items can I recycle?"),
            Text("   - Paper, plastic, metal, cardboard, and more."),
            SizedBox(height: 8),
            Text("• How do I view my pickup history?"),
            Text("   - Visit the Profile screen and tap on 'Pickup History'."),
            SizedBox(height: 24),
            Text(
              "Still need help?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green[600],
              ),
            ),
            SizedBox(height: 12),
            Text("You can contact our support team via email or phone:"),
            SizedBox(height: 8),
            Text("• Email: support@example.com"),
            Text("• Phone: +92-300-1234567"),
            SizedBox(height: 24),
            Text(
              "We usually respond within 24 hours.",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 16,
                color: const Color.fromARGB(255, 16, 66, 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
