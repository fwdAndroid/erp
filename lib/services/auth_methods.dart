import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp/models/user_models.dart';
import 'package:erp/screens/main/main_dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  Future<String> signUpUser({
    required BuildContext context, // Add BuildContext
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    String res = 'An error occurred';
    try {
      // Check if email is already registered
      List<String> methods = await FirebaseAuth.instance
          .fetchSignInMethodsForEmail(email);
      if (methods.isNotEmpty) {
        // Show error message in Scaffold
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email is already registered')),
        );
        return 'Email is already registered';
      } else {
        if (email.isNotEmpty && password.isNotEmpty && fullName.isNotEmpty) {
          UserCredential cred = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);

          UserModel userModel = UserModel(
            uid: cred.user!.uid,
            phoneNumber: phoneNumber,

            fullName: fullName,
            email: email,
            password: password,
          );

          await FirebaseFirestore.instance
              .collection('users')
              .doc(cred.user!.uid)
              .set(userModel.toJson());

          res = 'success';
          Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) => MainDashboard()),
          );
        }
      }
    } catch (e) {
      res = e.toString();
      // Optionally display the error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res)));
    }
    return res;
  }

  Future<String> loginUpUser({
    required String email,
    required String pass,
  }) async {
    String res = 'Wrong Email or Password';
    try {
      if (email.isNotEmpty && pass.isNotEmpty) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: pass,
        );
        res = 'success';
      } else {
        res = 'Please fill in all fields';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        res = 'No user found for this email.';
      } else if (e.code == 'wrong-password') {
        res = 'Wrong password provided.';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  // Google SignIn
}
