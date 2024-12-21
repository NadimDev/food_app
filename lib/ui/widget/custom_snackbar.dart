import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context,
    {Color backgroundColor = Colors.green,
    int durationInSeconds = 3,
    required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      backgroundColor: backgroundColor,
      duration: Duration(seconds: durationInSeconds),
      behavior: SnackBarBehavior.floating,
      // Optional for a floating snackbar
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
