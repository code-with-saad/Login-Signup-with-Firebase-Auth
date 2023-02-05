// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:app1/views/Home_view.dart';
import 'package:app1/views/signup_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isobsecure = true;
  @override
  login() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeView()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          "LOGIN",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: email,
          decoration: const InputDecoration(label: Text("Email")),
        ),
        TextField(
          obscureText: isobsecure,
          controller: password,
          decoration: InputDecoration(
              label: const Text("Password"),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isobsecure = !isobsecure;
                  });
                },
                child:
                    Icon(isobsecure ? Icons.visibility : Icons.visibility_off),
              )),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              login();
            },
            child: const Text("Login")),
        TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignupView()));
            },
            child: const Text("Did not have an account Sign up here"))
      ],
    ));
  }
}
