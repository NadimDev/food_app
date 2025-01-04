import 'package:flutter/material.dart';
import 'package:food_app/custom/widget.dart';

class AddFoodScreen extends StatefulWidget {
  const AddFoodScreen({super.key});

  static const String name = '/addFood-Screen';

  @override
  State<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Add Items',
            onTab: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
