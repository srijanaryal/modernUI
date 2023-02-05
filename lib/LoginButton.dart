import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'LoginOrRegister.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginButton extends StatefulWidget {
  Function()? onTap;

  LoginButton({super.key, required this.onTap});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 150),
      child: 
      ElevatedButton(
    child: Text("Sign in with Google"),
    onPressed: () async {
      try {
        await _googleSignIn.signIn();
        // navigate to the todo page
        Navigator.of(context).pushReplacementNamed('/todo');
      } catch (error) {
        print(error);
      }
    },
  ),
      // 
      // 
      // GestureDetector(
      //   onTap: widget.onTap,
      //   child: Container(
      //     height: 40,
      //     alignment: Alignment.center,
      //     decoration: BoxDecoration(
      //         border: Border.all(color: Colors.white, width: 2),
      //         color: Colors.black,
      //         borderRadius: BorderRadius.circular(10)),
      //     child: Text(
      //       'Login',
      //       style: TextStyle(color: Colors.white, fontSize: 20),
      //     ),
      //   ),
      // ),
    );
  }
}
