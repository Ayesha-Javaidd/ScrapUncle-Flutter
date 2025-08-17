import 'package:flutter/material.dart';
import 'package:scrapuncle_flutter/admin_screens/admin_logout.dart';
import 'package:scrapuncle_flutter/admin_screens/ageny_list_screen.dart';
import 'package:scrapuncle_flutter/admin_screens/admin_profile.dart';

import 'all_requests_screen.dart';
import 'assign_agent_screen.dart';

import 'customer_list_screen.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final options = [
      {
        "title": "All Requests",
        "icon": Icons.list_alt,
        "screen": AllRequestsScreen(),
      },
      {
        "title": "Assign Agents",
        "icon": Icons.assignment_ind,
        "screen": AssignAgentScreen(),
      },

      {
        "title": "Customer List",
        "icon": Icons.people,
        "screen": CustomerListScreen(),
      },
      {
        "title": "Agent List",
        "icon": Icons.supervisor_account,
        "screen": AgentListScreen(),
      },
      {
        "title": "View Profile",
        "icon": Icons.person,
        "screen": ProfileScreen(),
      },
      {"title": "Logout", "icon": Icons.logout, "screen": AdminLogout()},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Admin Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(height: 70),
            Expanded(
              child: GridView.builder(
                itemCount: options.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  final item = options[index];
                  return _buildCard(
                    context,
                    item["title"]! as String,
                    item["icon"] as IconData,
                    item["screen"] as Widget,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    String title,
    IconData icon,
    Widget screen,
  ) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 239, 244, 239),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.green[600]),
            const SizedBox(height: 12),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
