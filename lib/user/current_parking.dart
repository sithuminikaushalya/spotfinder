import 'package:flutter/material.dart';

class CurrentParking extends StatefulWidget {
  const CurrentParking({super.key});

  @override
  State<CurrentParking> createState() => _CurrentParkingState();
}

class _CurrentParkingState extends State<CurrentParking> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Current Parking'
      ),
    );
  }
}