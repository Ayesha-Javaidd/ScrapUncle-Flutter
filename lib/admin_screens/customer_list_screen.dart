// customer_list_screen.dart
import 'package:flutter/material.dart';

class CustomerListScreen extends StatelessWidget {
  const CustomerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customers = [
      {"name": "Ahmed", "phone": "0301-1234567", "address": "Lahore"},
      {"name": "Fatima", "phone": "0302-9876543", "address": "Karachi"},
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Customer List")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: customers.length,
        itemBuilder: (context, index) {
          final customer = customers[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.green),
              title: Text(customer['name']!),
              subtitle: Text("${customer['phone']} • ${customer['address']}"),
            ),
          );
        },
      ),
    );
  }
}
