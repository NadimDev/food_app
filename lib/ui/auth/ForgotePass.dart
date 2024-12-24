import 'package:flutter/material.dart';
import 'package:food_app/ui/auth/auth_controller.dart';

import '../utils/text_format.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  String email = '';
  final TextEditingController _controller = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _key,
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
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        setState(() {
                          email = _controller.text;
                        });
                        AuthController()
                            .forgotPassword(email: email, context: context);
                      }
                    },
                    child: Text('Send Email'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
