import 'package:assignment/views/dashboard_screen/dashboard_screen.dart';
import 'package:assignment/views/main_screen/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selctedIndex = 0;
  final List<Widget> screens = [
    DashboardScreen(),
    Container(
      color: Colors.white,
      child: Center(
        child: Text(
          'Maintenance',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
        ),
      ),
    ),
    Container(
      color: Colors.white,
      child: Center(
        child: Text(
          'Diagnostics',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
        ),
      ),
    ),
    Container(
      color: Colors.white,
      child: Center(
        child: Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selctedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selctedIndex,
        onTap: (index) {
          setState(() {
            selctedIndex = index;
          });
        },
      ),
    );
  }
}
