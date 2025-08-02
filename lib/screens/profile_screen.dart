import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Avatar Section
            CircleAvatar(
              radius: 48,
              backgroundColor: Colors.green.shade100,
              child: Icon(Icons.person, size: 48, color: Colors.green.shade600),
            ),
            const SizedBox(height: 12),
            Text(
              "Ayesha Javaid",
              style: TextStyle(
                fontSize: 22,
                color: Colors.green[600],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "ayesha@example.com",
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
              onTap: () {},
            ),
            _buildListTile(
              context,
              icon: Icons.location_on_outlined,
              title: "My Address",
              onTap: () {},
            ),
            _buildListTile(
              context,
              icon: Icons.history,
              title: "Pickup History",
              onTap: () {},
            ),

            const SizedBox(height: 16),
            _buildSectionHeader("App"),
            _buildListTile(
              context,
              icon: Icons.info_outline,
              title: "About Us",
              onTap: () {},
            ),
            _buildListTile(
              context,
              icon: Icons.help_outline,
              title: "Help & Support",
              onTap: () {},
            ),

            const SizedBox(height: 16),
            _buildListTile(
              context,
              icon: Icons.logout,
              title: "Logout",
              iconColor: Colors.red,
              textColor: Colors.red,
              onTap: () {
                // Show confirmation dialog
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text(
                      "Confirm Logout",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green[600],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    content: const Text("Are you sure you want to logout?"),
                    actions: [
                      TextButton(
                        child: const Text("Cancel"),
                        onPressed: () => Navigator.of(ctx).pop(),
                      ),
                      TextButton(
                        child: const Text(
                          "Logout",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          // Handle logout logic here
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
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
