// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController semail = TextEditingController();
  TextEditingController spassword = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  bool isobsecure = true;
  signup() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: semail.text,
        password: spassword.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Sign Up"),
          Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: semail,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email is required";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(label: Text("Email")),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: isobsecure,
                  controller: spassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password is required";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      label: const Text("Password"),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isobsecure = !isobsecure;
                          });
                        },
                        child: Icon(isobsecure
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  signup();
                }
              },
              child: const Text("Sign up"))
        ],
      ),
    );
  }
}
