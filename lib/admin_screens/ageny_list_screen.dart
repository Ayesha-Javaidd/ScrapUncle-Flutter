import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AgentListScreen extends StatelessWidget {
  const AgentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Agent List")),
      body: StreamBuilder<QuerySnapshot>(
        // Only fetch users where role == 'agent'
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('role', isEqualTo: 'agent')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No agents found."));
          }

          final agents = snapshot.data!.docs;

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: agents.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final agent = agents[index].data() as Map<String, dynamic>;

              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.green.shade100,
                    child: Icon(
                      Icons.delivery_dining,
                      color: Colors.green.shade600,
                    ),
                  ),
                  title: Text(
                    agent['name'] ?? "No Name",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    agent['phone'] ?? "No Phone",
                    style: theme.textTheme.bodyMedium,
                  ),
                  trailing: Icon(Icons.phone, color: Colors.green.shade700),
                  onTap: () {
                    // TODO: Implement call/contact agent
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
