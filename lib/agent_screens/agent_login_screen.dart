import 'package:flutter/material.dart';
import 'pickup_list_screen.dart';

class AgentLoginScreen extends StatelessWidget {
  AgentLoginScreen({super.key});

  final phoneController = TextEditingController();

  void _handleAgentLogin(BuildContext context) {
    final phone = phoneController.text.trim();

    if (phone.isEmpty || phone.length < 10) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Enter a valid phone number")));
      return;
    }

    // TODO: Add Firebase/Auth API login logic here
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => PickupListScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Agent Login")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: ListView(
          children: [
            SizedBox(height: 60),

            Center(child: Image.asset('assets/images/logo.png', height: 120)),
            SizedBox(height: 10),

            Center(
              child: Text(
                "ScrapUncle",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40),

            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Phone Number",
                prefixIcon: Icon(Icons.phone_android, color: Colors.green[600]),
              ),
            ),
            SizedBox(height: 24),

            ElevatedButton(
              onPressed: () => _handleAgentLogin(context),
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
