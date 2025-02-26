import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/admin/screen/add_food.dart';
import 'package:food_app/admin/screen/admin_login.dart';
import 'package:food_app/ui/home/home_screen.dart';
import 'package:food_app/ui/utils/app_constans.dart';
import 'package:food_app/ui/utils/color_file.dart';
import 'package:food_app/ui/utils/inputDecoration_theme.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publishAbleKey;
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AdminLogin.name,
      onGenerateRoute: (settings) {
        late Widget page;
        switch (settings.name) {
          case AdminLogin.name:
            page = const AdminLogin();
          case HomeScreen.name:
            page = const HomeScreen();
          case AddFoodScreen.name:
            page = const AddFoodScreen();
        }
        return MaterialPageRoute(builder: (context) {
          return page;
        });
      },
      debugShowCheckedModeBanner: false,
      title: 'Fast Food',
      theme: ThemeData(
        inputDecorationTheme: CustomInputDecoration.inputDecoration(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        elevatedButtonTheme: ElevatedButtonStyle(),
        useMaterial3: true,
      ),
      home: const AdminLogin(),
    );
  }

  ElevatedButtonThemeData ElevatedButtonStyle() {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      backgroundColor: ColorFile.primaryColor,
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 48),
    ));
  }
}
