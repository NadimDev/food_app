import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: size.height / 2),
            padding: const EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color.fromARGB(255, 53, 51, 51), Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.elliptical(size.width, 120),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
