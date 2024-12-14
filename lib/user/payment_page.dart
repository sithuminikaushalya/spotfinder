import 'package:flutter/material.dart';
import 'payment_details_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final List<Map<String, String>> paymentHistory = [
    {"date": "2024-01-12", "amount": "\$50.00", "status": "Completed"},
    {"date": "2024-01-08", "amount": "\$30.00", "status": "Completed"},
    {"date": "2024-01-01", "amount": "\$100.00", "status": "Pending"},
  ];

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
              'Payment History',
              style: TextStyle(
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold,
                color: const Color(0xff0D8230),
              ),
            ),
            SizedBox(height: height * 0.02),
            Expanded(
              child: ListView.builder(
                itemCount: paymentHistory.length,
                itemBuilder: (context, index) {
                  final payment = paymentHistory[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: height * 0.015),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: width * 0.04,
                        vertical: height * 0.01,
                      ),
                      title: Text(
                        payment['date']!,
                        style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 26, 26, 26),
                        ),
                      ),
                      subtitle: Text(
                        payment['status']!,
                        style: TextStyle(
                          fontSize: width * 0.04,
                          color: payment['status'] == 'Completed'
                              ? Colors.green
                              : Colors.orange,
                        ),
                      ),
                      trailing: Text(
                        payment['amount']!,
                        style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 26, 26, 26),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: height * 0.02),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0D8230),
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.2,
                    vertical: height * 0.02,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentDetailsPage(),
                    ),
                  );
                },
                child: Text(
                  'Make Payment',
                  style: TextStyle(
                    fontSize: width * 0.045,
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
