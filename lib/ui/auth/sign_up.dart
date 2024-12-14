import 'package:flutter/material.dart';
import 'package:food_app/ui/auth/signIn_screen.dart';

import '../utils/color_file.dart';
import '../utils/text_format.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isLoading = false;
  bool isVisible = false;

  void toggleVisibility() {
    setState(
      () {
        isVisible = !isVisible;
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blueAccent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height / 3),
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: const Text(''),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/7513626-removebg-preview.png',
                    width: size.width / 1.2,
                    height: size.height / 10,
                    fit: BoxFit.cover,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 40),
                  InputFeildSection(size, context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Material InputFeildSection(Size size, BuildContext context) {
    return Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              'Sign Up',
              style: TextFile.headerTextStyle().copyWith(color: Colors.blue),
            ),
            Form(
              key: _key,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      prefixIcon: Icon(Icons.person_rounded),
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter Valid Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter Valid Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    obscureText: isVisible,
                    controller: _passController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: toggleVisibility,
                          icon: Icon(isVisible
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      prefixIcon: const Icon(Icons.lock_outline),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Valid pass';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorFile.primaryColor),
                      onPressed: () {
                        if (_key.currentState!.validate()) {}
                      },
                      child: Text(
                        'Sign Up',
                        style: TextFile.header1TextStyle()
                            .copyWith(color: ColorFile.whiteColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("have an account? ",
                          style: TextFile.header3LightText()),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignIn()));
                        },
                        child: Text(
                          'Login',
                          style: TextFile.header3Text()
                              .copyWith(color: ColorFile.primaryColor),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}