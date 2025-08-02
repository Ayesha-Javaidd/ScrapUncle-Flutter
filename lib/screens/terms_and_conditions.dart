import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Terms & Conditions")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to Your ScrapUncle!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green[600],
              ),
            ),
            SizedBox(height: 26),
            Text(
              "By using our service, you agree to the following terms and conditions:",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 26),
            Text(
              "1. You must provide accurate information when scheduling a pickup.",
            ),
            Text(
              "2. The scrap rates are subject to change without prior notice.",
            ),
            Text(
              "3. Pickup availability depends on your location and time slot.",
            ),
            Text("4. You must be present at the scheduled time."),
            Text("5. We are not liable for any damage or loss during pickup."),
            SizedBox(height: 26),
            Text(
              "For more details, contact our support team.",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
