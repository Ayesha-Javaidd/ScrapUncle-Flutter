import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PickupHistoryScreen extends StatelessWidget {
  const PickupHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Scaffold(
        body: Center(child: Text("Please login to view history")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Pickup History')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("pickups")
            .where("userId", isEqualTo: user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'No pickup history yet.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          final pickups = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: pickups.length,
            itemBuilder: (context, index) {
              final data = pickups[index].data() as Map<String, dynamic>;

              // Extract scheduledAt timestamp
              final Timestamp scheduledAtTimestamp = data['scheduledAt'];
              final DateTime scheduledAt = scheduledAtTimestamp.toDate();
              final date =
                  "${scheduledAt.day}/${scheduledAt.month}/${scheduledAt.year}";
              final time = TimeOfDay.fromDateTime(scheduledAt).format(context);

              final weight = data['weight'] ?? '';
              final address = data['address'] ?? '';
              final status = data['status'] ?? 'Pending';

              return _buildPickupCard(
                context: context,
                date: date,
                time: time,
                weight: weight,
                address: address,
                status: status,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildPickupCard({
    required BuildContext context,
    required String date,
    required String time,
    required String weight,
    required String address,
    required String status,
  }) {
    final isCompleted = status.toLowerCase() == 'completed';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: Colors.green.shade100,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade600,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? Colors.green.shade100
                        : Colors.red.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isCompleted
                          ? Colors.green.shade800
                          : Colors.red.shade800,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildInfoRow(Icons.access_time, time),
            const SizedBox(height: 6),
            _buildInfoRow(Icons.scale, weight),
            const SizedBox(height: 6),
            _buildInfoRow(Icons.location_on, address),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.green.shade600),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
      ],
    );
  }
}
