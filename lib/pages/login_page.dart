import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kabaadiwala/pages/home_page.dart';
import 'package:kabaadiwala/pages/sign_up_page.dart';
import 'package:kabaadiwala/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.user});
 final User? user;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final User? user = FirebaseAuth.instance.currentUser;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Image.asset(
                    "assets/images/img3.jpg",
                    // fit: BoxFit.cover,
                  ).px8(),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Kabaadiwala aya Ree!!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            prefixIcon: Icon(Icons.contact_mail_rounded),
                            contentPadding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                            hintText: "Enter email",
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: "Email ID  ",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email Id cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: password,
                          obscureText: true,
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                              ),
                              prefixIcon: Icon(Icons.vpn_key_outlined),
                              contentPadding:
                                  EdgeInsets.fromLTRB(30, 20, 30, 20),
                              hintText: "Enter password",
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40))),
                              labelStyle: TextStyle(color: Colors.white)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (value.length < 6) {
                              return "Password length should be at least 6 ";
                            }
                            return null;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPassword())),
                                child: "Forgot password?"
                                    .text
                                    .underline
                                    .lg
                                    .color(Colors.white)
                                    .make())
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Material(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 10),
                          child: InkWell(
                            onTap: () async {
                              // setState(() {});
                              // try {
                              if ((email.text.isNotEmpty) &&
                                  (password.text.isNotEmpty)) {
                                changeButton = true;
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: email.text,
                                        password: password.text)
                                    .then((value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const HomePage()));
                                });
                              }
                            },
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              width: changeButton ? 50 : 150,
                              height: 50,
                              alignment: Alignment.center,
                              child: changeButton
                                  ? const Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Dont have an account?",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                          child: " Create one!"
                              .text
                              .xl2
                              .bold
                              .center
                              .color(Colors.white)
                              // .color(context.theme.accentColor)
                              .makeCentered()),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
