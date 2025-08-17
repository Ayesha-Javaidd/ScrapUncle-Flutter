import 'package:flutter/material.dart';

class AssignAgentScreen extends StatelessWidget {
  const AssignAgentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> agents = ['Ali', 'Sara', 'Usman'];
    final List<String> requests = ['REQ001', 'REQ002'];

    String? selectedAgent;
    String? selectedRequest;

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
              child: StatefulBuilder(
                builder: (context, setState) => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select Request",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: selectedRequest,
                      items: requests
                          .map(
                            (req) =>
                                DropdownMenuItem(value: req, child: Text(req)),
                          )
                          .toList(),
                      onChanged: (value) =>
                          setState(() => selectedRequest = value),
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
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Select Agent",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: selectedAgent,
                      items: agents
                          .map(
                            (agent) => DropdownMenuItem(
                              value: agent,
                              child: Text(agent),
                            ),
                          )
                          .toList(),
                      onChanged: (value) =>
                          setState(() => selectedAgent = value),
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
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (selectedAgent != null &&
                              selectedRequest != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Agent $selectedAgent assigned to $selectedRequest",
                                ),
                              ),
                            );
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
