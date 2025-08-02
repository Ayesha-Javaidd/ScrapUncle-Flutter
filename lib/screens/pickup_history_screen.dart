import 'package:flutter/material.dart';

class PickupHistoryScreen extends StatelessWidget {
  const PickupHistoryScreen({super.key});

  // Dummy data
  final List<Map<String, dynamic>> _history = const [
    {
      'date': '30 July 2025',
      'time': '10:30 AM',
      'weight': '8 KG',
      'address': '123 Green Street, Lahore',
      'status': 'Completed',
    },
    {
      'date': '22 July 2025',
      'time': '2:00 PM',
      'weight': '12 KG',
      'address': '45 Eco Avenue, Lahore',
      'status': 'Completed',
    },
    {
      'date': '15 July 2025',
      'time': '11:00 AM',
      'weight': '5 KG',
      'address': '78 Greenway Blvd, Lahore',
      'status': 'Missed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(title: const Text('Pickup History')),
      body: _history.isEmpty
          ? const Center(
              child: Text(
                'No pickup history yet.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _history.length,
              itemBuilder: (context, index) {
                final pickup = _history[index];
                return _buildPickupCard(context, pickup);
              },
            ),
    );
  }

  Widget _buildPickupCard(BuildContext context, Map<String, dynamic> pickup) {
    final isCompleted = pickup['status'] == 'Completed';

    return Card(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: Colors.green.shade100,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pickup['date'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
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
                    pickup['status'],
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
            const SizedBox(height: 10),
            _buildInfoRow(Icons.access_time, pickup['time']),
            const SizedBox(height: 6),
            _buildInfoRow(Icons.scale, pickup['weight']),
            const SizedBox(height: 6),
            _buildInfoRow(Icons.location_on, pickup['address']),
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
