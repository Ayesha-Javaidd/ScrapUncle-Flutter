import 'package:flutter/material.dart';
import 'admin_home_screen.dart';

class AdminLoginScreen extends StatelessWidget {
  AdminLoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _handleAdminLogin(BuildContext context) {
    // TODO: Implement real authentication logic (Firebase/Auth0/API)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => AdminHomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Use global theme

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Admin Login")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: ListView(
          children: [
            SizedBox(height: 60),

            // Logo
            Center(child: Image.asset('assets/images/logo.png', height: 120)),
            SizedBox(height: 10),

            // App Title
            Center(
              child: Text(
                "ScrapUncle – Admin",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40),

            // Email
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Admin Email",
                prefixIcon: Icon(
                  Icons.admin_panel_settings_outlined,
                  color: Colors.green[600],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Password
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock_outline, color: Colors.green[600]),
              ),
            ),
            SizedBox(height: 24),

            // Login Button
            ElevatedButton(
              onPressed: () => _handleAdminLogin(context),
              child: Text("Login"),
            ),

            SizedBox(height: 16),
            Center(
              child: Text(
                "Only authorized personnel can login.",
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
