import 'package:flutter/material.dart';
import 'package:spotfinder/user/payment_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  // Sample parking areas
  List<Map<String, String>> parkingAreas = [
    {'address': '123 Main St', 'status': 'Available', 'payment': 'Not Paid'},
    {'address': '456 Oak Rd', 'status': 'Available', 'payment': 'Not Paid'},
    {'address': '789 Pine Ave', 'status': 'Reserved', 'payment': 'Paid'},
  ];

  // List to store filtered parking areas
  late List<Map<String, String>> filteredParkingAreas;

  @override
  void initState() {
    super.initState();
    // Initialize filteredParkingAreas with all parking areas by default
    filteredParkingAreas = List.from(parkingAreas);

    // Add a listener to the searchController to filter list on text input
    searchController.addListener(() {
      filterParkingAreas(searchController.text);
    });
  }

  void filterParkingAreas(String query) {
    setState(() {
      if (query.isEmpty) {
        // Show all areas if the search field is empty
        filteredParkingAreas = List.from(parkingAreas);
      } else {
        // Filter the list based on the query
        filteredParkingAreas = parkingAreas
            .where((area) =>
                area['address']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Search Bar
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search your spot...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xff0D8230)),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Parking Areas List
          Expanded(
            child: filteredParkingAreas.isEmpty
                ? const Center(child: Text('No spots found'))
                : ListView.builder(
                    itemCount: filteredParkingAreas.length,
                    itemBuilder: (context, index) {
                      final area = filteredParkingAreas[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16.0),
                            title: Text(
                              area['address']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Status: ${area['status']}'),
                                Text('Payment Status: ${area['payment']}'),
                              ],
                            ),
                            trailing: area['status'] == 'Available'
                                ? ElevatedButton(
                                    onPressed: () {
                                      // Navigate to payment page or booking page
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PaymentPage(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff0D8230),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 8.0,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text('Reserve'),
                                  )
                                : Container(),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
