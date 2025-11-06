import 'package:assignment/services/authentication_service.dart';
import 'package:assignment/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final AuthenticationService authService = AuthenticationService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Image.asset(Images.logo, color: Colors.white, scale: 2),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              child: Image.asset(Images.logo, color: Colors.white, scale: 1.5),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home', style: TextStyle(fontSize: 16.sp)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings', style: TextStyle(fontSize: 16.sp)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout', style: TextStyle(fontSize: 16.sp)),
              onTap: () {
                authService.logout(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Image.asset(Images.splashImage, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
