import 'package:assignment/views/authentication_screen/login_screen.dart';
import 'package:assignment/views/main_screen/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class AuthenticationService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // user registarion
  Future<void> registerUser({
    required String name,
    required String company,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    if (name.isEmpty ||
        company.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      Fluttertoast.showToast(msg: "All fields are required");
      return;
    }

    if (password != confirmPassword) {
      Fluttertoast.showToast(msg: "Passwords do not match");
      return;
    }

    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Fluttertoast.showToast(msg: "Registration successful");
      await Future.delayed(const Duration(milliseconds: 300));

      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
          (route) => false,
        );
      }
    } 
    on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message ?? "Registration failed");
    } catch (e) {
      Fluttertoast.showToast(msg: "Error: $e");
    }
  }

  // Login user
  Future<void> loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill the eamil and password fields");
      return;
    }

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(msg: "Login successful");

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message ?? "Login failed");
    } catch (e) {
      Fluttertoast.showToast(msg: "Error: $e");
    }
  }

  // Logout
  Future<void> logout(BuildContext context) async {
    await auth.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  // user status
  Stream<User?> get authStateChanges => auth.authStateChanges();
}
