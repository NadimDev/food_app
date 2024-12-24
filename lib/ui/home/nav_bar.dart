import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:food_app/ui/home/profile.dart';
import 'package:food_app/ui/home/wallet.dart';


import 'home_screen.dart';
import 'order.dart';

//
class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    Order(),
    Wallet(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        animationDuration: const Duration(milliseconds: 500),
        backgroundColor: Colors.white,
        color: Colors.blue,
        items: const [
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.shopping_bag, color: Colors.white),
          Icon(Icons.wallet, color: Colors.white),
          Icon(Icons.person_outline, color: Colors.white),
        ],
        index: currentIndex,
        onTap: (int index) {
          setState(
                () {
              currentIndex = index;
            },
          );
        },
      ),
      body: pages[currentIndex],
    );
  }
}