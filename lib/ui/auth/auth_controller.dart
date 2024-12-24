import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/ui/auth/signIn_screen.dart';
import 'package:food_app/ui/home/nav_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../widget/custom_snackbar.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Email Registration Method
  Future<User?> registerWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // Create a new user
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Show success message
      showCustomSnackBar(
        context,
        backgroundColor: Colors.green,
        message: 'Registration Successful',
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => const NavBar()));
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Handle specific errors
      if (e.code == 'weak-password') {
        showCustomSnackBar(
          context,
          backgroundColor: Colors.red,
          message: 'Password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        showCustomSnackBar(
          context,
          backgroundColor: Colors.red,
          message: 'Account already exists for this email.',
        );
      } else {
        showCustomSnackBar(
          context,
          backgroundColor: Colors.red,
          message: 'Registration failed: ${e.message}',
        );
      }
      return null;
    }
  }

  Future<void> forgotPassword({
    required String email,
    required BuildContext context,
  }) async {
    try {
      // Create a new user
      await _auth.sendPasswordResetEmail(email: email);

      // Show success message
      showCustomSnackBar(
        context,
        backgroundColor: Colors.green,
        message: 'Otp Send Successful',
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => const SignIn()));
    } on FirebaseAuthException catch (e) {
      // Handle specific errors
      if (e.code == 'email-invalid') {
        showCustomSnackBar(
          context,
          backgroundColor: Colors.red,
          message: 'Enter valid email.',
        );
      } else {
        showCustomSnackBar(
          context,
          backgroundColor: Colors.red,
          message: 'Otp request failed: ${e.message}',
        );
      }
      return;
    }
    return;
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Show success message
      showCustomSnackBar(
        context,
        backgroundColor: Colors.green,
        message: 'Login Successful',
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => const NavBar()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showCustomSnackBar(
          context,
          backgroundColor: Colors.red,
          message: 'Password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        showCustomSnackBar(
          context,
          backgroundColor: Colors.red,
          message: 'Account already exists for this email.',
        );
      } else {
        showCustomSnackBar(
          context,
          backgroundColor: Colors.red,
          message: 'Registration failed: ${e.message}',
        );
      }
      return null;
    }
    return null;
  }

  // Google Sign-In Method
  Future<User?> signUpWithGoogle({
    required BuildContext context,
  }) async {
    try {
      // Trigger Google Sign-In
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // User canceled sign-in
        return null;
      }

      // Authenticate with Firebase
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Show success message
      showCustomSnackBar(
        context,
        backgroundColor: Colors.green,
        message: 'Google Sign-In Successful',
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => NavBar()));
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Handle sign-in errors
      showCustomSnackBar(
        context,
        backgroundColor: Colors.red,
        message: 'Google Sign-In failed: ${e.message}',
      );
      return null;
    }
  }

  // Sign-Out Method (Reusable for any auth)
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      await GoogleSignIn().signOut();

      // Show success message
      showCustomSnackBar(
        context,
        backgroundColor: Colors.green,
        message: 'Sign-Out Successful',
      );
    } catch (e) {
      showCustomSnackBar(
        context,
        backgroundColor: Colors.red,
        message: 'Sign-Out failed: ${e.toString()}',
      );
    }
  }
}
