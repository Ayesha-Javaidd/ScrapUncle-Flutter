import 'package:flutter/material.dart';

class AllRequestsScreen extends StatelessWidget {
  const AllRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final requests = [
      {"id": "REQ001", "status": "Pending"},
      {"id": "REQ002", "status": "Completed"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("All Pickup Requests")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: requests.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final request = requests[index];
            final status = request['status'];
            final isCompleted = status == 'Completed';

            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),
                title: Text(
                  "Request ID: ${request['id']}",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    "Status: $status",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isCompleted
                          ? theme.colorScheme.primary
                          : Colors.orange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                trailing: Icon(
                  Icons.info_outline,
                  color: theme.iconTheme.color,
                ),
                onTap: () {
                  // TODO: Open details screen
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
