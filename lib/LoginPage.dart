import 'package:calculatar/RegisterPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'MyTextField.dart';
import 'LoginButton.dart';
import 'forgot_password.dart';
import 'Google.dart';
import 'LoginOrRegister.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  ///Sign User In

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    //try signin

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

//PopUp for Wrong Email Message

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              message,
            ),
          );
        });
  }

  onTap() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),

              //Logo
              const Icon(
                size: 80,
                Icons.calculate,
                color: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),

              //Welcome to Calculator Please Login  In to use the calculator
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to Calculator \n Please Login to Use',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              MyTextField(
                hintText: 'Enter your Email',
                obscureText: false,
                controller: emailController,
              ),
              //Password Textfield
              MyTextField(
                hintText: 'Enter Your Password',
                obscureText: true,
                controller: passwordController,
              ),
              SizedBox(
                height: 10,
              ),
              //Forgoot Password

              ForgotPassword(),
              SizedBox(
                height: 20,
              ),
              //Sign In

              LoginButton(
                onTap: signUserIn,
              ),
              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 1.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Google(
                            ImagePath: 'images/GOOGLE.png',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Continue With Google',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 1.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Google(
                            ImagePath: 'images/facebook.png',
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Continue With Facebook',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?? ",
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: onTap,
                            child: Text(
                              'Register Now',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )

              //Continue With
              //Google and Facebook Sign IN
              //Be a Member Create an Account
            ],
          ),
        ),
      ),
    );
  }
}
