import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final serviceAreaController = TextEditingController();

  String? selectedRole;
  bool isLoading = false;

  Future<void> _handleSignup() async {
    if (selectedRole == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please select a role")));
      return;
    }

    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();
    final address = addressController.text.trim();
    final serviceArea = serviceAreaController.text.trim();

    if (name.isEmpty || email.isEmpty || phone.isEmpty || password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields properly")),
      );
      return;
    }

    if (selectedRole == "Customer" && address.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter your address")),
      );
      return;
    }

    if (selectedRole == "Agent" && serviceArea.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter your service area")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      // 1) Create user in Firebase Auth
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = cred.user!.uid;

      final userData = {
        "uid": uid,
        "name": name,
        "email": email,
        "phone": phone,
        "role": selectedRole!.toLowerCase(), // customer / agent / admin
        "address": selectedRole == "Customer" ? address : null,
        "serviceArea": selectedRole == "Agent" ? serviceArea : null,
        "created_at":
            FieldValue.serverTimestamp(), // 👈 server timestamp instead of device time
      }..removeWhere((key, value) => value == null || value == "");

      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .set(userData);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account created successfully")),
      );

      Navigator.pop(context); // go back to login
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Signup failed: ${e.message}")));
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.green, size: 20),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Signup")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16),
        child: ListView(
          children: [
            const SizedBox(height: 40),
            Center(
              child: Text(
                "ScrapUncle",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[600],
                ),
              ),
            ),
            const SizedBox(height: 25),

            TextField(
              controller: nameController,
              decoration: _inputDecoration("Full Name", Icons.person_outline),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: _inputDecoration("Email", Icons.email_outlined),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: _inputDecoration(
                "Phone Number",
                Icons.phone_outlined,
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: _inputDecoration("Password", Icons.lock_outline),
            ),
            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              value: selectedRole,
              decoration: _inputDecoration(
                "Select Role",
                Icons.account_circle_outlined,
              ),
              items: const [
                DropdownMenuItem(value: "Customer", child: Text("Customer")),
                DropdownMenuItem(value: "Agent", child: Text("Agent")),
              ],
              onChanged: (value) {
                setState(() {
                  selectedRole = value;
                });
              },
            ),
            const SizedBox(height: 12),

            if (selectedRole == "Customer")
              TextField(
                controller: addressController,
                decoration: _inputDecoration("Address", Icons.home_outlined),
              ),
            if (selectedRole == "Agent")
              TextField(
                controller: serviceAreaController,
                decoration: _inputDecoration(
                  "Service Area",
                  Icons.map_outlined,
                ),
              ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.green[600],
                ),
                onPressed: isLoading ? null : _handleSignup,
                child: isLoading
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text(
                        "Create Account",
                        style: TextStyle(fontSize: 15),
                      ),
              ),
            ),
            const SizedBox(height: 14),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Login",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.green[600],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
