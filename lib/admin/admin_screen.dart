import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  // Mock data for users
  final List<Map<String, String>> users = [
    {"name": "John Doe", "email": "john.doe@example.com", "role": "User"},
    {"name": "Jane Smith", "email": "jane.smith@example.com", "role": "Admin"},
    {
      "name": "Alice Johnson",
      "email": "alice.johnson@example.com",
      "role": "User"
    },
  ];

  void _showUserDetails(Map<String, String> user) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("${user['name']}'s Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name: ${user['name']}"),
              Text("Email: ${user['email']}"),
              Text("Role: ${user['role']}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
          vertical: size.height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Admin Dashboard',
              style: TextStyle(
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.bold,
                color: const Color(0xff0D8230),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              'User Management',
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: size.height * 0.015),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: size.height * 0.01),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                        vertical: size.height * 0.015,
                      ),
                      title: Text(
                        user['name']!,
                        style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        user['email']!,
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          color: Colors.black54,
                        ),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () => _showUserDetails(user),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff0D8230),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'View',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality to navigate to another admin feature, e.g., view statistics
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.2,
                    vertical: size.height * 0.02,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'View Statistics',
                  style: TextStyle(
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
