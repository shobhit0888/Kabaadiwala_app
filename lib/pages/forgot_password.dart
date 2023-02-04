import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

// final _auth = FirebaseAuth.instance;
final User? user = FirebaseAuth.instance.currentUser;
final uid = user?.uid;

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailTextController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              backgroundColor: Colors.transparent,
              content: Material(
                borderRadius: BorderRadius.circular(15),
                elevation: 8,
                child: Container(
                  width: MediaQuery.of(context).size.width - 30,
                  padding: const EdgeInsets.all(10),
                  height: 200,
                  child: "reset link".text.bold.makeCentered(),
                ),
              ));
        },
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              backgroundColor: Colors.transparent,
              content: Material(
                borderRadius: BorderRadius.circular(15),
                elevation: 8,
                child: Container(
                  width: MediaQuery.of(context).size.width - 30,
                  padding: const EdgeInsets.all(10),
                  height: 200,
                  child: "Invalid User".text.bold.makeCentered(),
                ),
              ));
        },
      );
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
                Image.asset("assets/images/forgot_password.png"),
                SizedBox(
                  height: 20,
                ),
                "Enter your registered email to reset your password"
                    .text
                    .center
                    .bold
                    .color(Colors.white)
                    .xl2
                    .makeCentered()
                    .px32(),
                // Text(
                //   "an email has been sent" + " to your email id",
                //   style: TextStyle(
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        controller: _emailTextController,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          prefixIcon: Icon(Icons.account_circle_outlined),
                          contentPadding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                          hintText: "Enter registered email id",
                          labelText: "Registered Email Id",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email Id cannot be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        onPressed: passwordReset,
                        child: "Request Link".text.color(Colors.black).make(),
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 110,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
