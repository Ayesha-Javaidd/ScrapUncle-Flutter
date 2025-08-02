import 'package:flutter/material.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _handleLogin() {
    // TODO: Add Firebase Auth or API login logic here
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access app-wide theme

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Login")),
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
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.green[600],
                ),
              ),
            ),
            SizedBox(height: 16),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock_outline, color: Colors.green[600]),
              ),
            ),
            SizedBox(height: 24),

            ElevatedButton(onPressed: _handleLogin, child: Text("Login")),
            SizedBox(height: 16),

            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SignupScreen()),
                  );
                },
                child: Text.rich(
                  TextSpan(
                    text: "Don’t have an account?  ",
                    style: theme.textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: "Sign up",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
