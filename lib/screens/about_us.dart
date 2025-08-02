import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About Us")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Who We Are",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green[600],
              ),
            ),
            SizedBox(height: 12),
            Text(
              "We are a passionate team committed to making recycling easier and more accessible for everyone. Our mission is to promote environmental sustainability by connecting households with responsible scrap collectors.",
            ),
            SizedBox(height: 20),
            Text(
              "What We Do",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green[600],
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Using our app, you can schedule pickups for your recyclable items like newspapers, plastics, and metals. We ensure timely and transparent scrap collection with competitive rates.",
            ),
            SizedBox(height: 20),
            Text(
              "Why Choose Us?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green[600],
              ),
            ),
            SizedBox(height: 12),
            Text("• Easy and fast pickup scheduling"),
            Text("• Trusted and verified scrap collectors"),
            Text("• Real-time rate information"),
            Text("• Environment-friendly mission"),
            SizedBox(height: 24),
            Text(
              "Join us in building a cleaner Pakistan!",
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: const Color.fromARGB(255, 10, 77, 45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
