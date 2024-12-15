import 'package:flutter/material.dart';

class CurrentParking extends StatefulWidget {
  const CurrentParking({super.key});

  @override
  State<CurrentParking> createState() => _CurrentParkingState();
}

class _CurrentParkingState extends State<CurrentParking> {
  // Sample data for current parking slots
  List<Map<String, dynamic>> parkingData = [
    {
      'vehicleNumber': 'ABC-1234',
      'parkingTime': '10:30 AM',
      'status': 'Occupied',
    },
    {
      'vehicleNumber': 'XYZ-5678',
      'parkingTime': '11:15 AM',
      'status': 'Occupied',
    },
    {
      'vehicleNumber': 'LMN-9876',
      'parkingTime': '12:00 PM',
      'status': 'Occupied',
    },
  ];

  // Function to release parking
  void releaseParking(int index) {
    setState(() {
      parkingData[index]['status'] = 'Available';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Parking spot for vehicle ${parkingData[index]['vehicleNumber']} released.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Parking',
              style: TextStyle(
                fontSize: width * 0.07,
                fontWeight: FontWeight.bold,
                color: const Color(0xff0D8230),
              ),
            ),
            SizedBox(height: height * 0.02),
            Expanded(
              child: ListView.builder(
                itemCount: parkingData.length,
                itemBuilder: (context, index) {
                  final parking = parkingData[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: height * 0.01),
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vehicle Number: ${parking['vehicleNumber']}',
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            'Parking Time: ${parking['parkingTime']}',
                            style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Status: ${parking['status']}',
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: parking['status'] == 'Occupied'
                                      ? Colors.red
                                      : Colors.green,
                                ),
                              ),
                              if (parking['status'] == 'Occupied')
                                ElevatedButton(
                                  onPressed: () => releaseParking(index),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff0D8230),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.04,
                                      vertical: height * 0.01,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    'Release',
                                    style: TextStyle(color: Colors.white),
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
          ],
        ),
      ),
    );
  }
}
