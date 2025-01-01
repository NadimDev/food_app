import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_app/services/database.dart';
import 'package:food_app/ui/services/share_pref.dart';
import 'package:food_app/ui/utils/text_format.dart';
import 'package:http/http.dart' as http;

import '../utils/app_constans.dart';
import '../utils/color_file.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final TextEditingController _controller = TextEditingController();
  Map<String, dynamic>? paymentIntent;
  int? add;
  String? wallet, id;

  getSharePef() async {
    wallet = await SharePefHelper.getUserWallet();
    id = await SharePefHelper.getUserId();
    setState(() {});
  }

  Future<void> onLoad() async {
    await getSharePef();
    setState(() {});
  }

  @override
  void initState() {
    onLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: wallet == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              margin: const EdgeInsets.only(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 2.0,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Center(
                        child: Text(
                          'Wallet',
                          style: TextFile.headerTextStyle(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    decoration: BoxDecoration(color: Colors.grey.shade100),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/wallet.png',
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 16),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Wallet',
                                style: TextFile.header3Text()
                                    .copyWith(color: Colors.black54),
                              ),
                              Text(
                                "\$${wallet!}",
                                style: TextFile.header1TextStyle(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add Money',
                          style: TextFile.header1TextStyle(),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildAmountButton('100'),
                            _buildAmountButton('500'),
                            _buildAmountButton('1000'),
                            _buildAmountButton('2000'),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            onEdit();
                          },
                          child: const Text('Add Money'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildAmountButton(String amount) {
    return GestureDetector(
      onTap: () {
        makePayment(amount);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '\$$amount',
            style: TextFile.header3Text(),
          ),
        ),
      ),
    );
  }

  Future<void> makePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'USD');
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          googlePay: const PaymentSheetGooglePay(
              testEnv: true, currencyCode: "USD", merchantCountryCode: "US"),
          merchantDisplayName: 'Nadim',
        ),
      );
      await displayPaymentSheet(amount);
    } catch (e) {
      print("Exception during payment: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Payment failed. Please try again.")),
      );
    }
  }

  Future<void> displayPaymentSheet(String amount) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      add = int.parse(wallet!) + int.parse(amount);
      await SharePefHelper.saveUserWallet(add.toString());
      await DatabaseMethod.addWallet(id!, add.toString());
      print('Wallet: $wallet, ID: $id');
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: ColorFile.primaryColor,
              ),
              const SizedBox(width: 16),
              const Text("Payment successful!"),
            ],
          ),
        ),
      );
      await getSharePef();
      paymentIntent = null;
    } catch (e) {
      print('Error during payment sheet display: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Payment Cancelled")),
      );
    }
  }

  Future<Map<String, dynamic>?> createPaymentIntent(
      String amount, String currency) async {
    try {
      final Map<String, dynamic> body = {
        'amount': ((int.parse(amount)) * 100).toString(),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      final response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );

      return jsonDecode(response.body);
    } catch (err) {
      print('Error creating payment intent: $err');
      return null;
    }
  }

  Future<void> onEdit() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                Row(
                  spacing: 50,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.black,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ),
                    Text(
                      'Add Amount',
                      style: TextFile.header2Text()
                          .copyWith(color: ColorFile.primaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Amount',
                  style: TextFile.header3Text(),
                ),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(hintText: 'Enter Your Amount'),
                ),
                ElevatedButton(
                  onPressed: () {
                    makePayment(_controller.text);
                    Navigator.pop(context);
                    _controller.clear();
                  },
                  child: Text('Pay'),
                )
              ],
            ),
          ),
        ),
      );
}
