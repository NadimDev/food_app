import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/ui/utils/text_format.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onTab;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      elevation: 2,
      child: Container(
        margin: const EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 8),
        width: size.width,
        child: Center(
          child: Row(
            children: [
              IconButton(
                onPressed: onTab,
                icon: Icon(Icons.arrow_back_ios_new),
              ),
              Text(
                title,
                style: TextFile.headerTextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
