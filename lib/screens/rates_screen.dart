import 'package:flutter/material.dart';

class RatesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> dummyRates = [
    {
      'name': 'Newspaper',
      'image': 'assets/images/newspaper.png',
      'rate': 'Rs. 25/kg',
      'description': 'Old newspapers and paper materials',
    },
    {
      'name': 'Tin',
      'image': 'assets/images/tin.png',
      'rate': 'Rs. 70/kg',
      'description': 'Used tin cans and scrap',
    },
    {
      'name': 'Plastic Bottles',
      'image': 'assets/images/bottle.png',
      'rate': 'Rs. 15/kg',
      'description': 'PET bottles and plastic containers',
    },
    {
      'name': 'Mix Waste',
      'image': 'assets/images/mixwaste.png',
      'rate': 'Rs. 5/kg',
      'description': 'Unsorted recyclable waste',
    },
    {
      'name': 'Books',
      'image': 'assets/images/book.png',
      'rate': 'Rs. 20/kg',
      'description': 'Used books and notebooks',
    },
    {
      'name': 'Iron Scrap',
      'image': 'assets/images/iron.png',
      'rate': 'Rs. 40/kg',
      'description': 'Old iron tools and materials',
    },
    {
      'name': 'AC Units',
      'image': 'assets/images/ac.png',
      'rate': 'Rs. 300/unit',
      'description': 'Old air conditioners',
    },
    {
      'name': 'Washing Machine',
      'image': 'assets/images/washing_machine.png',
      'rate': 'Rs. 500/unit',
      'description': 'Used washing machines',
    },
    {
      'name': 'Laptop',
      'image': 'assets/images/laptop.png',
      'rate': 'Rs. 800/unit',
      'description': 'Old laptops and electronics',
    },
    {
      'name': 'Oven',
      'image': 'assets/images/oven.png',
      'rate': 'Rs. 250/unit',
      'description': 'Used ovens and microwaves',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(title: const Text('Rates')),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: dummyRates.length,
        itemBuilder: (context, index) {
          final item = dummyRates[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12), // Padding inside the card
              child: Row(
                children: [
                  Image.asset(
                    item['image'],
                    width: 70, // Bigger image
                    height: 70,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromARGB(255, 87, 86, 86),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['description'],
                          style: const TextStyle(
                            color: Color.fromARGB(255, 108, 107, 107),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    item['rate'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.green[700],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
