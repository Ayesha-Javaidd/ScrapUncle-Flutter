import 'package:flutter/material.dart';

class PickupDetailScreen extends StatelessWidget {
  final Map<String, String> pickup;

  const PickupDetailScreen({super.key, required this.pickup});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pickup Details")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _detailRow("📦 Request ID", pickup['id']),
                _detailRow("📍 Address", pickup['address']),
                _detailRow("🚚 Status", pickup['status']),
                SizedBox(height: 30),
                ElevatedButton.icon(
                  icon: Icon(Icons.check_circle_outline),
                  label: Text("Mark as Completed"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    minimumSize: Size(double.infinity, 48),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Pickup ${pickup['id']} marked as completed",
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 16),
                OutlinedButton.icon(
                  icon: Icon(Icons.phone),
                  label: Text("Contact Customer"),
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(double.infinity, 48),
                    side: BorderSide(color: Colors.green),
                  ),
                  onPressed: () {
                    // Add actual call logic using url_launcher here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Calling customer...")),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _detailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: RichText(
        text: TextSpan(
          text: "$label: ",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          children: [
            TextSpan(
              text: value ?? "",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
