import 'package:flutter/material.dart';
import 'pickup_detail_screen.dart';

class PickupListScreen extends StatelessWidget {
  final List<Map<String, String>> pickups = [
    {"id": "REQ001", "address": "123 Street, City", "status": "Pending"},
    {"id": "REQ002", "address": "456 Road, City", "status": "Assigned"},
  ];

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Assigned':
        return Icons.check_circle_outline;
      case 'Pending':
        return Icons.hourglass_empty;
      default:
        return Icons.help_outline;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Assigned':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Assigned Pickups")),
      body: ListView.builder(
        itemCount: pickups.length,
        itemBuilder: (context, index) {
          final pickup = pickups[index];
          final status = pickup['status']!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: _getStatusColor(status).withOpacity(0.1),
                  child: Icon(
                    _getStatusIcon(status),
                    color: _getStatusColor(status),
                    size: 28,
                  ),
                ),
                title: Text(
                  pickup['id']!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Text(pickup['address']!, style: TextStyle(fontSize: 14)),
                    SizedBox(height: 4),
                    Text(
                      "Status: $status",
                      style: TextStyle(
                        color: _getStatusColor(status),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PickupDetailScreen(pickup: pickup),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
