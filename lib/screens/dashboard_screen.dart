import 'package:flutter/material.dart';
import 'package:scrapuncle_flutter/screens/pickup_history_screen.dart';
import 'package:scrapuncle_flutter/screens/profile_screen.dart';
import 'package:scrapuncle_flutter/screens/rates_screen.dart';
import 'package:scrapuncle_flutter/screens/schedule_pickup_screen.dart';
import 'package:scrapuncle_flutter/screens/settings_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('ScrapUncle'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'settings') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'settings',
                child: SizedBox(
                  width: 150,
                  child: Text(
                    'Settings',
                    style: TextStyle(color: Color.fromARGB(255, 94, 93, 93)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.green),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'ScrapUncle',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: theme.iconTheme.color),
              title: Text(
                'Home',
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15),
              ),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.price_change, color: theme.iconTheme.color),
              title: Text(
                'Rates',
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RatesScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.schedule, color: theme.iconTheme.color),
              title: Text(
                'Schedule',
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SchedulePickupScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.fire_truck, color: theme.iconTheme.color),
              title: Text(
                'Pickup History',
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PickupHistoryScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: theme.iconTheme.color),
              title: Text(
                'Profile',
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset('assets/images/logo.png', height: 120),
          ),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SchedulePickupScreen(),
                  ),
                );
              },
              child: const Text(
                "SCHEDULE A PICKUP",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green),
            ),
            child: Row(
              children: [
                const Icon(Icons.location_on, color: Colors.green),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "We are currently operable in Lahore!",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.green.shade900,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 45),
          Center(
            child: Text(
              "Impact by Scrapuncle",
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Image.asset('assets/images/recycle.png', height: 300),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(20),
            color: const Color(0xFFDFF5DC),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: 160,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RatesScreen(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.green),
                        padding: const EdgeInsets.symmetric(vertical: 9),
                      ),
                      child: const Text(
                        "RATES",
                        style: TextStyle(
                          color: Color.fromARGB(255, 27, 111, 30),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: const Text(
                    "Our Services",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 16),

                // Services Cards
                _serviceCard(
                  icon: Icons.home_repair_service,
                  title: "Doorstep Scrap Pickup",
                  subtitle:
                      "Schedule a pickup at your convenience, and our team will collect scrap from your doorstep.",
                ),
                const SizedBox(height: 12),
                _serviceCard(
                  icon: Icons.recycling,
                  title: "Responsible Recycling",
                  subtitle:
                      "We ensure that all collected materials are recycled responsibly to reduce landfill waste.",
                ),
                const SizedBox(height: 12),
                _serviceCard(
                  icon: Icons.attach_money,
                  title: "Fair & Transparent Rates",
                  subtitle:
                      "We provide competitive and clear rates for your scrap, ensuring fair value for your contribution.",
                ),
                const SizedBox(height: 12),
                _serviceCard(
                  icon: Icons.eco,
                  title: "Eco-friendly Waste Management",
                  subtitle:
                      "Join us in building a greener planet with sustainable and eco-friendly waste management practices.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _serviceCard({
  required IconData icon,
  required String title,
  required String subtitle,
}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 4,
    shadowColor: Colors.green.shade100,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 32, color: Colors.green.shade600),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.green.shade600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 113, 112, 112),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
