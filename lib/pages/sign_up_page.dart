import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String value = "";
  final _auth = FirebaseAuth.instance;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController Contact_number = TextEditingController();
  TextEditingController Address_line1 = TextEditingController();
  TextEditingController Address_line2 = TextEditingController();
  TextEditingController Landmark = TextEditingController();
  TextEditingController cityORtown = TextEditingController();
  TextEditingController Pin_code = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.canvasColor,
        body: Container(
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                    child: Form(
                        key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                height: 35,
                              ),
                              "Create Account"
                                  .text
                                  .xl4
                                  .bold
                                  .color(Colors.purple)
                                  .makeCentered(),
                              SizedBox(
                                height: 25,
                              ),
                              TextFormField(
                                controller: name,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.local_library_rounded),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Enter your name",
                                  labelText: "Name",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Name cannot be empty";
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: email,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.contact_mail_rounded),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Enter Email id",
                                  labelText: "Email id",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email id cannot be empty";
                                  } else if (value.isNotEmpty) {
                                    RegExp regex = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                                    if (!regex.hasMatch(value)) {
                                      return "Enter valid email";
                                    }
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: Contact_number,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.local_library_rounded),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Enter Contact Number",
                                  labelText: "Contact Number",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Contact Number cannot be empty";
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: Address_line1,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.local_library_rounded),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Enter Flat/House no.",
                                  labelText: "Flat/House no.",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Address_Line1 cannot be empty";
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: Address_line2,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.local_library_rounded),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Enter Area/Colony/Village",
                                  labelText: "Area/Colony/Village",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Address_Line2 cannot be empty";
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: Landmark,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.local_library_rounded),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Enter Landmark *(optional)",
                                  labelText: "Landmark *(optional)",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                onChanged: (value) {},
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: cityORtown,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.local_library_rounded),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Enter City/Town",
                                  labelText: "City/Town",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "City/Town cannot be empty";
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: Pin_code,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.local_library_rounded),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Enter Pin Code",
                                  labelText: "Pin Code",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                maxLength: 6,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Pin Code cannot be empty";
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: password,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.local_library_rounded),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Enter password",
                                  labelText: "Password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password cannot be empty";
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                              Container(
                                height: 75,
                                width: 150,
                                // decoration: BoxDecoration(
                                //     shape: BoxShape.rectangle,
                                //     borderRadius: BorderRadius.circular(40)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      // CollectionReference users =
                                      //     firestore.collection('Schools');
                                      // await users.doc("pp").set({'name': "google"});
                                      if (_formKey.currentState!.validate()) {
                                        // setState(() {});
                                        try {
                                          User? newUser = (await _auth
                                                  .createUserWithEmailAndPassword(
                                                      email: email.text,
                                                      password: password.text))
                                              .user;
                                          if (newUser != null) {
                                            // ignore: use_build_context_synchronously
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomePage()));
                                          }
                                          // await addUser();
                                          await firestore
                                              .collection("donators")
                                              .doc(_auth.currentUser!.uid)
                                              .set({
                                            'name': name.text,
                                            'email': email.text,
                                            'Contact_number':
                                                Contact_number.text,
                                            'Address_Line1': Address_line1.text,
                                            'Address_Line2': Address_line2.text,
                                            'Lankmark': Landmark.text,
                                            'cityORtown': cityORtown.text,
                                            'Pin_code': Pin_code.text,
                                            'password': password.text,
                                          });
                                          print("DONE");
                                        } catch (e) {
                                          print(e);
                                        }
                                      }
                                      ;
                                    },
                                    child: "Submit".text.bold.xl.makeCentered(),
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(156, 39, 176, 1),
                                    ),
                                  ),
                                ),
                              )
                            ]))))));
  }

  Future<void> addUser() {
    return users
        .doc(_auth.currentUser!.uid)
        .set({
          'name': name.text,
          'email': email.text,
          'Contact_number': Contact_number.text,
          'Address_Line1': Address_line1.text,
          'Address_Line2': Address_line2.text,
          'Lankmark': Landmark.text,
          'cityORtown': cityORtown.text,
          'Pin_code': Pin_code.text,
          'password': password.text,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
