import 'package:flutter/material.dart';

import '../utils/text_format.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Password Recovery',
                style: TextFile.headerTextStyle()
                    .copyWith(color: Colors.blue, fontSize: 32),
              ),
              Text(
                'Enter your mail',
                style: TextFile.header3LightText(),
              ),
              SizedBox(
                height: 24,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Email', prefixIcon: Icon(Icons.person)),
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Send Email'))
            ],
          ),
        ),
      ),
    );
  }
}
