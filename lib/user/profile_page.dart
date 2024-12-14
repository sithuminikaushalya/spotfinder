import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;

  TextEditingController nameController =
      TextEditingController(text: 'John Doe');
  TextEditingController emailController =
      TextEditingController(text: 'john.doe@example.com');
  TextEditingController phoneController =
      TextEditingController(text: '+123 456 7890');
  TextEditingController addressController =
      TextEditingController(text: '123 Main Street, Springfield, USA');
  TextEditingController dobController =
      TextEditingController(text: 'Jan 1, 1990');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              SizedBox(height: height * 0.05),
              Center(
                child: CircleAvatar(
                  radius: width * 0.2,
                  backgroundImage: const NetworkImage(
                    'https://via.placeholder.com/150',
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              isEditing
                  ? Column(
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(labelText: 'Name'),
                        ),
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(labelText: 'Email'),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Text(
                          nameController.text,
                          style: TextStyle(
                            fontSize: width * 0.06,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 26, 26, 26),
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          emailController.text,
                          style: TextStyle(
                            fontSize: width * 0.04,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
              SizedBox(height: height * 0.04),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildEditableDetail(
                        label: 'Phone',
                        controller: phoneController,
                        isEditing: isEditing,
                      ),
                      Divider(thickness: 1, color: Colors.grey[300]),
                      _buildEditableDetail(
                        label: 'Address',
                        controller: addressController,
                        isEditing: isEditing,
                      ),
                      Divider(thickness: 1, color: Colors.grey[300]),
                      _buildEditableDetail(
                        label: 'Date of Birth',
                        controller: dobController,
                        isEditing: isEditing,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),
              // Action Button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0D8230),
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.2,
                    vertical: height * 0.015,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (isEditing) {
                      // Save updates
                      // You can add code here to persist the changes, e.g., sending them to a server
                    }
                    isEditing = !isEditing;
                  });
                },
                icon: Icon(isEditing ? Icons.save : Icons.edit),
                label: Text(isEditing ? 'Save Updates' : 'Edit Profile'),
              ),
              SizedBox(height: height * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableDetail({
    required String label,
    required TextEditingController controller,
    required bool isEditing,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 5),
        isEditing
            ? TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: label,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              )
            : Text(
                controller.text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 26, 26, 26),
                ),
              ),
      ],
    );
  }
}
