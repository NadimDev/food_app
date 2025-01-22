import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/ui/utils/text_format.dart';
import 'package:email_validator/email_validator.dart';

import 'home_admin.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  static const String name = '/admin';

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

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
                colors: [
                  Color.fromARGB(255, 53, 51, 255),
                  Colors.blue,
                  Colors.lightBlueAccent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.elliptical(size.width, 120),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 30, left: 20, top: size.height / 9),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "Let's start with \nAdmin!",
                      style: TextFile.headerTextStyle().copyWith(fontSize: 28),
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 4,
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        height: size.height / 2.3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          spacing: 24,
                          children: [
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _emailController,
                              decoration:
                                  const InputDecoration(hintText: 'Email'),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Enter Correct Email';
                                } else if (!EmailValidator.validate(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _passController,
                              decoration:
                                  const InputDecoration(hintText: 'Password'),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Enter Correct Password';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    loginAdmin();
                                  }
                                },
                                child: const Text('Login'))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  loginAdmin() {
    FirebaseFirestore.instance.collection('Admin').get().then(
      (snapshot) {
        for (var value in snapshot.docs) {
          if (mounted) {
            if (value.data()['id'] != _emailController.text.trim()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Your id is not correct'),
                ),
              );
            }
          } else if (value.data()['password'] != _passController.text) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.white,
                  content: Text(
                    'Your password is not correct',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              );
            }
          } else {
            Route route = MaterialPageRoute(
              builder: (context) => const HomeAdmin(),
            );
            if (mounted) {
              Navigator.pushReplacement(context, route);
            }
          }
        }
      },
    );
  }
}
