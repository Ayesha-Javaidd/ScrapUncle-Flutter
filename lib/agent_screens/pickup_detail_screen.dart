import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PickupDetailScreen extends StatelessWidget {
  final Map<String, String> pickup;

  const PickupDetailScreen({super.key, required this.pickup});

  Future<void> _markAsCompleted(BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('pickups')
          .doc(pickup['id']) // pickup doc ID
          .update({'status': 'completed'});

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Pickup ${pickup['id']} marked as completed"),
          backgroundColor: Colors.green[600],
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error updating status: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pickup Details"),
        backgroundColor: Colors.green[600],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _detailRow(Icons.assignment, "Request ID", pickup['id']),
                _detailRow(Icons.location_on, "Address", pickup['address']),
                _detailRow(Icons.local_shipping, "Status", pickup['status']),
                const SizedBox(height: 40),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => _markAsCompleted(context),
                  child: const Text(
                    "Mark as Completed",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),

                const SizedBox(height: 16),

                // 📞 Contact Customer Button
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    side: BorderSide(color: Colors.green.shade600, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // TODO: integrate with url_launcher
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Calling customer...")),
                    );
                  },
                  child: Text(
                    "Contact Customer",
                    style: TextStyle(
                      color: Colors.green[700],
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _detailRow(IconData icon, String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.green[600], size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header label in green
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                // Value in grey, smaller
                Text(
                  value ?? "",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
