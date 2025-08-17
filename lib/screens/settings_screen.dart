import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scrapuncle_flutter/screens/about_us.dart';
import 'package:scrapuncle_flutter/screens/privacy_policy.dart';
import 'package:scrapuncle_flutter/screens/profile_screen.dart';
import 'package:scrapuncle_flutter/screens/terms_and_conditions.dart';
import 'package:scrapuncle_flutter/screens/login_screen.dart'; // import your login screen

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // If still checking auth state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // If user is signed out, show login screen automatically
        if (!snapshot.hasData || snapshot.data == null) {
          return LoginScreen();
        }

        // User is signed in, show Settings screen
        return Scaffold(
          appBar: AppBar(title: const Text('Settings')),
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const SizedBox(height: 16),
              _buildSectionHeader('Account'),
              _buildListTile(
                icon: Icons.person_outline,
                title: 'Profile',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
              ),
              _buildListTile(
                icon: Icons.lock_outline,
                title: 'Change Password',
                onTap: () {},
              ),
              const SizedBox(height: 24),
              _buildSectionHeader('Legal'),
              _buildListTile(
                icon: Icons.description_outlined,
                title: 'Terms & Conditions',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TermsAndConditionsScreen(),
                    ),
                  );
                },
              ),
              _buildListTile(
                icon: Icons.privacy_tip_outlined,
                title: 'Privacy Policy',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              _buildSectionHeader('App'),
              _buildListTile(
                icon: Icons.info_outline,
                title: 'About',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUsScreen(),
                    ),
                  );
                },
              ),
              _buildListTile(
                icon: Icons.logout,
                title: 'Logout',
                iconColor: Colors.red,
                textColor: Colors.red,
                onTap: () async {
                  try {
                    await FirebaseAuth.instance.signOut();

                    if (!mounted) return;

                    // Navigate to login screen and remove all previous routes
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false, // remove all previous routes
                    );
                  } catch (e) {
                    if (!mounted) return;
                    debugPrint("Logout error: $e");
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Failed to logout. Try again."),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 98, 97, 97),
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.green),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          color: textColor ?? Colors.grey[700],
          fontWeight: FontWeight.normal,
        ),
      ),
      onTap: onTap,
    );
  }
}
