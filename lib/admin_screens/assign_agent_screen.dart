import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AssignAgentScreen extends StatefulWidget {
  const AssignAgentScreen({super.key});

  @override
  State<AssignAgentScreen> createState() => _AssignAgentScreenState();
}

class _AssignAgentScreenState extends State<AssignAgentScreen> {
  String? selectedAgentId;
  String? selectedRequestId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Assign Agent")),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔹 Requests Dropdown
                    Text(
                      "Select Request",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('pickups')
                          .where('status', isEqualTo: 'scheduled')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final requests = snapshot.data!.docs;

                        if (requests.isEmpty) {
                          return const Text("No pending requests found");
                        }

                        return DropdownButtonFormField<String>(
                          value: selectedRequestId,
                          isExpanded: true,
                          items: requests
                              .map(
                                (req) => DropdownMenuItem(
                                  value: req.id,
                                  child: Text(
                                    "ID: ${req.id}",
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 108, 108, 108),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() => selectedRequestId = value);
                          },
                          decoration: InputDecoration(
                            hintText: "Choose request ID",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    /// 🔹 Agents Dropdown
                    Text(
                      "Select Agent",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .where('role', isEqualTo: 'agent')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final agents = snapshot.data!.docs;

                        if (agents.isEmpty) {
                          return const Text("No agents found");
                        }

                        return DropdownButtonFormField<String>(
                          value: selectedAgentId,
                          isExpanded: true,
                          items: agents
                              .map(
                                (agent) => DropdownMenuItem(
                                  value: agent.id,
                                  child: Text(
                                    agent['name'] ?? "No Name",
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 108, 108, 108),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() => selectedAgentId = value);
                          },
                          decoration: InputDecoration(
                            hintText: "Choose agent",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 30),

                    /// 🔹 Assign Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          if (selectedAgentId != null &&
                              selectedRequestId != null) {
                            try {
                              // fetch agent details
                              final agentDoc = await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(selectedAgentId)
                                  .get();

                              final agentData =
                                  agentDoc.data() as Map<String, dynamic>;

                              // 🔹 1. update pickup request
                              await FirebaseFirestore.instance
                                  .collection('pickups')
                                  .doc(selectedRequestId)
                                  .update({
                                    'assignedAgentId': selectedAgentId,
                                    'assignedAgentName':
                                        agentData['name'] ?? '',
                                    'status': 'assigned',
                                  });

                              // 🔹 2. update agent's assigned requests (in agents collection)
                              await FirebaseFirestore.instance
                                  .collection('agents')
                                  .doc(selectedAgentId)
                                  .set({
                                    'assignedRequests': FieldValue.arrayUnion([
                                      selectedRequestId,
                                    ]),
                                  }, SetOptions(merge: true));

                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Agent ${agentData['name']} assigned to request $selectedRequestId",
                                    ),
                                  ),
                                );
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Error: $e")),
                              );
                            }
                          }
                        },
                        icon: const Icon(Icons.assignment_turned_in),
                        label: const Text("Assign"),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: Colors.green[600],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
