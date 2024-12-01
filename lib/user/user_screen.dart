import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:spotfinder/user/current_parking.dart';
import 'package:spotfinder/user/home_page.dart';
import 'package:spotfinder/user/payment_page.dart';
import 'package:spotfinder/user/profile_page.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int currentTableIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late HomePage homepage;
  late ProfilePage profile;
  late PaymentPage payments;
  late CurrentParking parking;

  @override
  void initState() {
    homepage = const HomePage();
    payments = const PaymentPage();
    parking = const CurrentParking();
    profile = const ProfilePage();
    pages = [homepage, parking, payments, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.09),
        child: AppBar(
          title: Text(
            'SpotFinder',
            style: TextStyle(
              color: const Color.fromARGB(255, 26, 26, 26),
              fontWeight: FontWeight.bold,
              fontSize: width * 0.055,
            ),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(width * 0.02, 0, 0, 0),
                child: Icon(
                  Boxicons.bx_menu_alt_left,
                  color: const Color.fromARGB(255, 128, 128, 128),
                  size: width * 0.1,
                ),
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xff0D8230),
              ),
              child: Text(
                'SpotFinder',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                _showLogoutConfirmationDialog(context);
              },
            ),
          ],
        ),
      ),
      body: pages[currentTableIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: const Color(0xff0D8230),
        animationDuration: const Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTableIndex = index;
          });
        },
        items: const [
          Icon(
            Boxicons.bx_home,
            color: Colors.white,
          ),
          Icon(
            Boxicons.bx_car,
            color: Colors.white,
          ),
          Icon(
            Boxicons.bx_money,
            color: Colors.white,
          ),
          Icon(
            Boxicons.bxs_user,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Are you sure you want to exit the app?'),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Color(0xff0D8230),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Color(0xff0D8230),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
