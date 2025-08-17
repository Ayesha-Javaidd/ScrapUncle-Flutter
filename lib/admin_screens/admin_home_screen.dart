import 'package:flutter/material.dart';
import 'package:scrapuncle_flutter/admin_screens/ageny_list_screen.dart';

import 'all_requests_screen.dart';
import 'assign_agent_screen.dart';
import 'report_screen.dart';
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
        "title": "Generate Reports",
        "icon": Icons.insert_chart_outlined,
        "screen": ReportScreen(),
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
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Admin Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: GridView.builder(
          itemCount: options.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
          boxShadow: [
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
            SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              // style: GoogleFonts.poppins(
              //   fontSize: 16,
              //   fontWeight: FontWeight.w500,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
