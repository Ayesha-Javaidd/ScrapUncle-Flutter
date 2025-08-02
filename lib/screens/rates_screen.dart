import 'package:flutter/material.dart';

class RatesScreen extends StatelessWidget {
  RatesScreen({super.key});

  final List<Map<String, String>> rates = [
    {
      'service': 'Standard Delivery',
      'weight': 'Below 5 KG',
      'price': 'PKR 200',
    },
    {'service': 'Standard Delivery', 'weight': '5-10 KG', 'price': 'PKR 300'},
    {'service': 'Standard Delivery', 'weight': '10-20 KG', 'price': 'PKR 400'},
    {'service': 'Standard Delivery', 'weight': '20+ KG', 'price': 'PKR 500'},
    {'service': 'Express Delivery', 'weight': 'Below 5 KG', 'price': 'PKR 350'},
    {'service': 'Express Delivery', 'weight': '5-10 KG', 'price': 'PKR 450'},
    {'service': 'Express Delivery', 'weight': '10-20 KG', 'price': 'PKR 600'},
    {'service': 'Express Delivery', 'weight': '20+ KG', 'price': 'PKR 750'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rates')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: rates.length,
          itemBuilder: (context, index) {
            final rate = rates[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rate['service']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Weight: ${rate['weight']}'),
                        Text(
                          rate['price']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
