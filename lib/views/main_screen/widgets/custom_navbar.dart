import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
       
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: Colors.transparent,
        onTap: onTap,
        unselectedItemColor:Colors.white,
        selectedItemColor:Colors.red[100],
        showUnselectedLabels: true,
        selectedFontSize: 12.sp,
        unselectedFontSize: 11.sp,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.speed_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_accessibility_outlined),
            label: 'Maintenance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_off_sharp),
            label: 'Diagnostics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
