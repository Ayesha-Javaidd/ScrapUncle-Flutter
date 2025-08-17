import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scrapuncle_flutter/admin_screens/admin_home_screen.dart';
import 'package:scrapuncle_flutter/agent_screens/pickup_list_screen.dart';

import 'signup_screen.dart';
import 'dashboard_screen.dart'; // Customer

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _handleLogin(BuildContext context) async {
    try {
      // 1️⃣ Sign in with Firebase Auth
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      final uid = userCredential.user!.uid;

      // 2️⃣ Get user data from Firestore
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (!doc.exists) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("No user data found!")));
        return;
      }

      final role = doc['role'] as String;

      // 3️⃣ Navigate based on role
      if (role.toLowerCase() == "customer") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => DashboardScreen()),
        );
      } else if (role.toLowerCase() == "agent") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => PickupListScreen()),
        );
      } else if (role.toLowerCase() == "admin") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => AdminHomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Unknown role: $role")));
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "Login failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: ListView(
          children: [
            const SizedBox(height: 60),

            Center(child: Image.asset('assets/images/logo.png', height: 120)),
            const SizedBox(height: 10),

            Center(
              child: Text(
                "ScrapUncle",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),

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
            const SizedBox(height: 16),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock_outline, color: Colors.green[600]),
              ),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () => _handleLogin(context),
              child: const Text("Login"),
            ),
            const SizedBox(height: 16),

            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupScreen()),
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
