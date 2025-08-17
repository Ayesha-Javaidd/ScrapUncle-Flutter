import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:scrapuncle_flutter/screens/about_us.dart';
import 'package:scrapuncle_flutter/screens/edit_profile.dart';
import 'package:scrapuncle_flutter/screens/help_and_support.dart';
import 'package:scrapuncle_flutter/screens/login_screen.dart';
import 'package:scrapuncle_flutter/screens/pickup_history_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? name;
  String? email;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot doc = await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .get();

        if (doc.exists) {
          setState(() {
            name = doc["name"];
            email = doc["email"];
            isLoading = false;
          });
        }
      }
    } catch (e) {
      debugPrint("Error fetching user data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Automatically show login screen if signed out
        if (!snapshot.hasData || snapshot.data == null) {
          return LoginScreen();
        }

        return Scaffold(
          appBar: AppBar(title: const Text("Profile")),
          body: isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 48,
                        backgroundColor: Colors.green.shade100,
                        child: Icon(
                          Icons.person,
                          size: 48,
                          color: Colors.green.shade600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        name ?? "No Name",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.green[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        email ?? "No Email",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 103, 101, 101),
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildSectionHeader("Account"),
                      _buildListTile(
                        context,
                        icon: Icons.edit,
                        title: "Edit Profile",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfileScreen(),
                            ),
                          );
                        },
                      ),
                      _buildListTile(
                        context,
                        icon: Icons.history,
                        title: "Pickup History",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PickupHistoryScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildSectionHeader("App"),
                      _buildListTile(
                        context,
                        icon: Icons.info_outline,
                        title: "About Us",
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
                        context,
                        icon: Icons.help_outline,
                        title: "Help & Support",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HelpSupportScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildListTile(
                        context, // ✅ pass context here
                        icon: Icons.logout,
                        title: 'Logout',
                        iconColor: Colors.red,
                        textColor: Colors.red,

                        // onTap: () async {
                        //   try {
                        //     await FirebaseAuth.instance.signOut();
                        //     // No navigation needed, StreamBuilder will update automatically
                        //   } catch (e) {
                        //     if (!mounted) return;
                        //     debugPrint("Logout error: $e");
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //       const SnackBar(
                        //         content: Text("Failed to logout. Try again."),
                        //       ),
                        //     );
                        //   }
                        // },
                        onTap: () async {
                          try {
                            await FirebaseAuth.instance.signOut();

                            if (!mounted) return;

                            // Navigate to login screen and remove all previous routes
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
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
                ),
        );
      },
    );
  }

  Widget _buildSectionHeader(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
      leading: Icon(
        icon,
        color: iconColor ?? Theme.of(context).iconTheme.color,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? Theme.of(context).textTheme.bodyMedium?.color,
          fontSize: 15,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
