import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 16),

          _buildSectionHeader('Account'),
          _buildListTile(
            icon: Icons.person_outline,
            title: 'Profile',
            onTap: () {
              // TODO: Navigate to profile
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
            onTap: () {},
          ),
          _buildListTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            onTap: () {},
          ),

          const SizedBox(height: 24),

          _buildSectionHeader('App'),
          _buildListTile(
            icon: Icons.info_outline,
            title: 'About',
            onTap: () {},
          ),
          _buildListTile(
            icon: Icons.logout,
            title: 'Logout',
            iconColor: Colors.red, // Make icon red
            textColor: Colors.red, // Make text red
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
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
          fontSize: 14,
          color: textColor ?? Colors.grey[700],
          fontWeight: FontWeight.normal,
        ),
      ),
      onTap: onTap,
    );
  }
}
