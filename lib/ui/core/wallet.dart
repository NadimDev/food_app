import 'package:flutter/material.dart';
import 'package:food_app/ui/utils/text_format.dart';
class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          ' Map',
          style: TextFile.header1TextStyle().copyWith(color: Colors.white),
        ),
      ),
    );
  }
}