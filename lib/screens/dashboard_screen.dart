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
                  // Themed Text
                  Text(
                    'ScrapUncle',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: Icon(
                Icons.home,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                'Home',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 15),
              ),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(
                Icons.price_change,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                'Rates',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 15),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RatesScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.schedule,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                'Schedule',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 15),
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
              leading: Icon(
                Icons.fire_truck,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                'Pickup History',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 15),
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
              leading: Icon(
                Icons.person,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                'Profile',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 15),
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
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Image.asset('assets/images/logo.png', height: 120),
          ),
          const SizedBox(height: 15),

          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
            padding: EdgeInsets.all(20),
            color: Color(0xFFDFF5DC),
            child: Column(
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

                const SizedBox(height: 30),

                const Text(
                  "About Us",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Scrapuncle is a sustainable waste management platform helping you schedule scrap pickups effortlessly. We ensure responsible recycling to reduce landfill burden and contribute to a greener planet.",
                ),
                const SizedBox(height: 24),
                const Text(
                  "Contact",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                const Text("Phone: +92 3314551480"),
                const Text("Email: support@scrapuncle.com"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
