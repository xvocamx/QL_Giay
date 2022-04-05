import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Screen/Sign In.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //Dang nhap
  Future signIn(String email, String password) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
  //Dang ky
  Future signUp(String email, String password, String name, String address,
      String phone, BuildContext context) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = FirebaseAuth.instance.currentUser;
      await _firebaseFirestore.collection('users').doc(user?.uid).set({
        'uid': user?.uid,
        'email': email,
        'name': name,
        'address': address,
        'phoneNumber': phone,
      });
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Sign Up Succeeded'),
                content:
                    const Text("You account was created, you can now login"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignIn();
                        }));
                      },
                      child: const Text('OK'))
                ],
              ));
    } on FirebaseAuthException catch (e) {
      handleSignUpError(e, context);
    }
  }

  void handleSignUpError(FirebaseException e, BuildContext context) {
    String messageToDisplay;
    switch (e.code) {
      case 'email-already-in-use':
        messageToDisplay = "This email is alreadly in use";
        break;
      case 'invalid-email':
        messageToDisplay = "This email you enter is invalid";
        break;
      case 'operation-not-allowed':
        messageToDisplay = "This operation is not allowed";
        break;
      case 'weak-password':
        messageToDisplay = "The password you entered is too weak";
        break;
      default:
        messageToDisplay = "An unknow error occurred";
        break;
    }
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Sign Up Failed'),
              content: Text(messageToDisplay),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'))
              ],
            ));
  }

  // Dang xuat
  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
