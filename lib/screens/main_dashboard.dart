import 'package:flutter/material.dart';
import 'package:partymania_users/screens/dashboardpages/booking_page.dart';
import 'package:partymania_users/screens/dashboardpages/club_page.dart';
import 'package:partymania_users/screens/dashboardpages/home_page.dart';
import 'package:partymania_users/screens/dashboardpages/profile_page.dart';
import 'package:partymania_users/utils/colors.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(), // Replace with your screen widgets
    ClubPage(),
    BookingPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 0 ? 'assets/homeblue.png' : 'assets/home.png',
              height: 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 1 ? 'assets/code.png' : 'assets/clubnocolor.png',
              height: 25,
            ),
            label: 'Clubs',
          ),
          BottomNavigationBarItem(
            label: "Bookings",
            icon: Image.asset(
              _currentIndex == 2 ? 'assets/note.png' : 'assets/note_1.png',
              height: 25,
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Image.asset(
              _currentIndex == 3 ? 'assets/profile_color.png' : 'assets/p.png',
              height: 25,
            ),
          ),
        ],
        unselectedLabelStyle: TextStyle(color: textColor.withOpacity(.8)),
        selectedLabelStyle: TextStyle(color: textColor),
        backgroundColor:
            backgroundColor, // Set your desired background color here
        selectedItemColor: textColor, // Set the color for selected item
        unselectedItemColor:
            textColor.withOpacity(.8), // Set the color for unselected items
      ),
    );
  }
}
