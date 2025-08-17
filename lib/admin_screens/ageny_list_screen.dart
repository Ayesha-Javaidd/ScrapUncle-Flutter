// agent_list_screen.dart
import 'package:flutter/material.dart';

class AgentListScreen extends StatelessWidget {
  const AgentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final agents = [
      {"name": "Ali", "phone": "0311-4455667"},
      {"name": "Zara", "phone": "0315-7788990"},
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Agent List")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: agents.length,
        itemBuilder: (context, index) {
          final agent = agents[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.delivery_dining, color: Colors.green),
              title: Text(agent['name']!),
              subtitle: Text(agent['phone']!),
              trailing: Icon(Icons.phone),
              onTap: () {
                // TODO: Call or contact agent logic
              },
            ),
          );
        },
      ),
    );
  }
}
