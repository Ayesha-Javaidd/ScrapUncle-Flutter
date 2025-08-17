// import 'package:flutter/material.dart';

// class SchedulePickupScreen extends StatefulWidget {
//   const SchedulePickupScreen({super.key});

//   @override
//   State<SchedulePickupScreen> createState() => _SchedulePickupScreenState();
// }

// class _SchedulePickupScreenState extends State<SchedulePickupScreen> {
//   final _formKey = GlobalKey<FormState>();
//   String? _selectedWeight;
//   DateTime? _selectedDate;
//   TimeOfDay? _selectedTime;
//   final TextEditingController _addressController = TextEditingController();

//   final List<String> _weightOptions = [
//     'Below 5 KG',
//     '5-10 KG',
//     '10-20 KG',
//     '20+ KG',
//   ];

//   Future<void> _selectDate() async {
//     final today = DateTime.now();
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: today,
//       firstDate: today,
//       lastDate: today.add(const Duration(days: 30)),
//     );
//     if (picked != null) {
//       setState(() => _selectedDate = picked);
//     }
//   }

//   Future<void> _selectTime() async {
//     final picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (picked != null) {
//       setState(() => _selectedTime = picked);
//     }
//   }

//   void _schedulePickup() {
//     if (_formKey.currentState!.validate()) {
//       if (_selectedDate == null || _selectedTime == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Please select date and time')),
//         );
//         return;
//       }

//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text('Pickup Scheduled!')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Schedule Pickup')),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return SingleChildScrollView(
//             padding: const EdgeInsets.all(20),
//             child: ConstrainedBox(
//               constraints: BoxConstraints(minHeight: constraints.maxHeight),
//               child: IntrinsicHeight(
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       SizedBox(height: 50),
//                       DropdownButtonFormField<String>(
//                         decoration: const InputDecoration(
//                           labelText: 'Estimated Weight',
//                           border: OutlineInputBorder(),
//                         ),
//                         items: _weightOptions.map((weight) {
//                           return DropdownMenuItem(
//                             value: weight,
//                             child: Text(weight),
//                           );
//                         }).toList(),
//                         value: _selectedWeight,
//                         onChanged: (value) =>
//                             setState(() => _selectedWeight = value),
//                         validator: (value) => value == null
//                             ? 'Please select estimated weight'
//                             : null,
//                       ),

//                       SizedBox(height: 30),
//                       TextFormField(
//                         style: TextStyle(color: Colors.green[700]),
//                         readOnly: true,
//                         onTap: _selectDate,
//                         decoration: const InputDecoration(
//                           labelText: 'Select Date',
//                           suffixIcon: Icon(Icons.calendar_today),
//                           border: OutlineInputBorder(),
//                         ),
//                         controller: TextEditingController(
//                           text: _selectedDate == null
//                               ? ''
//                               : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
//                         ),
//                         validator: (_) => _selectedDate == null
//                             ? 'Please select a date'
//                             : null,
//                       ),
//                       SizedBox(height: 30),
//                       TextFormField(
//                         style: TextStyle(color: Colors.green[700]),
//                         readOnly: true,
//                         onTap: _selectTime,
//                         decoration: const InputDecoration(
//                           labelText: 'Select Time',
//                           suffixIcon: Icon(Icons.access_time),
//                           border: OutlineInputBorder(),
//                         ),
//                         controller: TextEditingController(
//                           text: _selectedTime == null
//                               ? ''
//                               : _selectedTime!.format(context),
//                         ),
//                         validator: (_) => _selectedTime == null
//                             ? 'Please select a time'
//                             : null,
//                       ),
//                       SizedBox(height: 30),
//                       TextFormField(
//                         controller: _addressController,
//                         maxLines: 3,
//                         style: TextStyle(color: Colors.green[700]),
//                         decoration: const InputDecoration(
//                           labelText: 'Pickup Address',
//                           border: OutlineInputBorder(),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.green,
//                               width: 2,
//                             ),
//                           ),
//                         ),
//                         validator: (value) => value == null || value.isEmpty
//                             ? 'Please enter pickup address'
//                             : null,
//                       ),
//                       SizedBox(height: 30),
//                       ElevatedButton(
//                         onPressed: _schedulePickup,
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           textStyle: const TextStyle(fontSize: 16),
//                         ),
//                         child: const Text('Schedule Pickup'),
//                       ),
//                     ],
//                     // .map(
//                     //   (e) => Padding(
//                     //     padding: const EdgeInsets.symmetric(
//                     //       vertical: 0,
//                     //     ),
//                     //     child: e,
//                     //   ),
//                     // )
//                     // .toList(),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SchedulePickupScreen extends StatefulWidget {
  const SchedulePickupScreen({super.key});

  @override
  State<SchedulePickupScreen> createState() => _SchedulePickupScreenState();
}

class _SchedulePickupScreenState extends State<SchedulePickupScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedWeight;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final List<String> _weightOptions = [
    'Below 5 KG',
    '5-10 KG',
    '10-20 KG',
    '20+ KG',
  ];

  bool isLoading = false;

  @override
  void dispose() {
    _addressController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final today = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? today,
      firstDate: today,
      lastDate: today.add(const Duration(days: 30)),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  Future<void> _selectTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
        _timeController.text = picked.format(context);
      });
    }
  }

  Future<void> _schedulePickup() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedDate == null || _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select date and time')),
      );
      return;
    }

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You must be signed in to schedule a pickup'),
        ),
      );
      // Optionally navigate to login
      return;
    }

    // Combine date & time into a single DateTime
    final scheduledAt = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    setState(() => isLoading = true);

    try {
      final collection = FirebaseFirestore.instance.collection('pickups');
      final docRef = collection.doc(); // auto-generated id

      final data = <String, dynamic>{
        'pickupId': docRef.id,
        'userId': user.uid,
        'userName': user.displayName ?? '',
        'userEmail': user.email ?? '',
        'weight': _selectedWeight,
        'scheduledAt': Timestamp.fromDate(scheduledAt),
        'address': _addressController.text.trim(),
        'status': 'scheduled',
        'agentId': null,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      }..removeWhere((k, v) => v == null || (v is String && v.isEmpty));

      await docRef.set(data);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pickup scheduled successfully!')),
      );

      // Optionally clear the form:
      setState(() {
        _selectedWeight = null;
        _selectedDate = null;
        _selectedTime = null;
        _dateController.clear();
        _timeController.clear();
        _addressController.clear();
      });
    } on FirebaseException catch (e) {
      debugPrint('Firestore error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to schedule pickup: ${e.message}')),
      );
    } catch (e) {
      debugPrint('Error: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Something went wrong')));
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Schedule Pickup')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // const SizedBox(height: 30),
                      // DropdownButtonFormField<String>(
                      //   decoration: const InputDecoration(
                      //     labelText: 'Estimated Weight',
                      //     border: OutlineInputBorder(),
                      //   ),
                      //   items: _weightOptions.map((weight) {
                      //     return DropdownMenuItem(
                      //       value: weight,
                      //       child: Text(weight),
                      //     );
                      //   }).toList(),
                      //   value: _selectedWeight,
                      //   onChanged: (value) =>
                      //       setState(() => _selectedWeight = value),
                      //   validator: (value) => value == null
                      //       ? 'Please select estimated weight'
                      //       : null,
                      // ),
                      SizedBox(height: 50),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Estimated Weight',
                          border: OutlineInputBorder(),
                        ),
                        items: _weightOptions.map((weight) {
                          return DropdownMenuItem(
                            value: weight,
                            child: Text(weight),
                          );
                        }).toList(),
                        value: _selectedWeight,
                        onChanged: (value) =>
                            setState(() => _selectedWeight = value),
                        validator: (value) => value == null
                            ? 'Please select estimated weight'
                            : null,
                      ),

                      const SizedBox(height: 30),
                      TextFormField(
                        style: TextStyle(color: Colors.green[700]),
                        controller: _dateController,
                        readOnly: true,
                        onTap: _selectDate,
                        decoration: const InputDecoration(
                          labelText: 'Select Date',
                          suffixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(),
                        ),
                        validator: (_) => _selectedDate == null
                            ? 'Please select a date'
                            : null,
                      ),

                      const SizedBox(height: 30),
                      TextFormField(
                        style: TextStyle(color: Colors.green[700]),
                        controller: _timeController,
                        readOnly: true,
                        onTap: _selectTime,
                        decoration: const InputDecoration(
                          labelText: 'Select Time',
                          suffixIcon: Icon(Icons.access_time),
                          border: OutlineInputBorder(),
                        ),
                        validator: (_) => _selectedTime == null
                            ? 'Please select a time'
                            : null,
                      ),

                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _addressController,
                        maxLines: 2,
                        style: TextStyle(color: Colors.green[700]),
                        decoration: const InputDecoration(
                          labelText: 'Pickup Address',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Please enter pickup address'
                            : null,
                      ),

                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: isLoading ? null : _schedulePickup,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        child: isLoading
                            ? const SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text('Schedule Pickup'),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
