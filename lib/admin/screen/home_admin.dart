import 'package:flutter/material.dart';
import 'package:food_app/admin/screen/add_food.dart';
import 'package:food_app/ui/utils/text_format.dart';

import '../../custom/widget.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Home Admin',
            onTab: () {
              Navigator.pop(context);
            },
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AddFoodScreen.name);
            },
            child: Container(
              width: size.width,
              height: size.height * 0.12,
              margin: const EdgeInsets.only(
                  top: 40, right: 20, left: 20, bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.blue,
              ),
              child: Row(
                spacing: 16,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Image.asset('assets/images/salad2.png'),
                    ),
                  ),
                  Text(
                    'Add Food Items',
                    style: TextFile.header1TextStyle()
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
