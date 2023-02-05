import 'package:camera/camera.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kabaadiwala/pages/donate.dart';
import 'package:kabaadiwala/pages/dump.dart';
import 'package:kabaadiwala/pages/report.dart';
import 'package:kabaadiwala/pages/sell.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_typing_uninitialized_variables
  // late final firstCamera;
  final _auth = FirebaseAuth.instance;
  bool load = false;
  @override
  void initState() {
    super.initState();
    getCurrentUser();

    // loadData();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        User loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        // child: Visibility(
        //   visible: load,
        // ignore: sort_child_properties_last
        child: ListView(
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              title: "Kabaadiwala".text.color(Colors.black).make(),
              backgroundColor: Colors.white,
              // ignore: prefer_const_literals_to_create_immutables
            ),
            SizedBox(
              height: 25,
            ),
            CarouselSlider(
                items: [
                  Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage("assets/images/img1.jpg"),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage("assets/images/img2.jpg"),
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
                options: CarouselOptions(
                    aspectRatio: 18 / 12,
                    autoPlay: true,
                    height: 225,
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8)),
            Card(
              elevation: 60,
              color: Colors.grey[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.fromLTRB(15, 25, 15, 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ListTile(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sell())),
                    // leading: Image.asset(
                    //   width: 150,
                    //   height: 250,
                    //   'assets/images/3D_image.jpg',
                    // ),
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 2, 0, 1),
                      child: Text(
                        "Sell",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 2, 0, 1),
                      child: Text(
                        "Sell the waste to clean the houses and get some money",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 60,
              color: Colors.grey[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ListTile(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dump())),
                    // leading: Image.asset(
                    //   width: 150,
                    //   height: 250,
                    //   'assets/images/3D_image.jpg',
                    // ),
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 2, 0, 1),
                      child: Text(
                        "Dump",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 2, 0, 1),
                      child: Text(
                        "Welcome to the DumpsVille",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 60,
              color: Colors.grey[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ListTile(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Donate())),
                    // leading: Image.asset(
                    //   width: 150,
                    //   height: 250,
                    //   'assets/images/3D_image.jpg',
                    // ),
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 2, 0, 1),
                      child: Text(
                        "Donate",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 2, 0, 1),
                      child: Text(
                        "Its better to donate than accumulate",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 60,
              color: Colors.grey[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ListTile(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Report())),
                    // leading: Image.asset(
                    //   width: 150,
                    //   height: 250,
                    //   'assets/images/3D_image.jpg',
                    // ),
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 2, 0, 1),
                      child: Text(
                        "Report",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 2, 0, 1),
                      child: Text(
                        "Sell the waste to clean the houses and get some money",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "About Us :".text.color(Colors.white).bold.xl2.makeCentered(),
                  SizedBox(
                    height: 10,
                  ),
                  "Kabaadiwala is a network based sustainable platform dealing with the right time tracing and treatment(collection and recycle) of the black waste *."
                      .text
                      .color(Colors.white)
                      .make(),
                  SizedBox(
                    height: 10,
                  ),
                  "Problem statement: Untraceable, uncollected and non recycled waste(black waste) is killing our resouces and mother earth exponentially."
                      .text
                      .color(Colors.white)
                      .make(),
                  SizedBox(
                    height: 10,
                  ),
                  "=>In today's time we are consuming and using a lot of things like electronic devices, stationary, utensils, automobiles, etc. These all turn to waste after a specific point of time. The real problem is not that these things are turning to waste but the problem is that this waste is not tracked. *For the case to be precise a TV bought in a widow home is lying in the store-room for years but what if its parts have been recyled or reused at right time. Reasons of the Problem: 1.Busy routines 2.Unawareness 3.Carelessness and laziness 4.Non carriability 5.Unreachability"
                      .text
                      .color(Colors.white)
                      .make(),
                  SizedBox(
                    height: 10,
                  ),
                  "Solutions: We are creating a platform named 'Kabaadiwala' to deal with this problem. So how actually we are solving this problem ....this is the questiond... 'Kabaadiwala' basically works with four features: 1.Sell - This section deals with the users who want to sell the waste in their houses by calling nearby waste collector to their houses. 2.Dump - This section deals the voluntary dumping of the waste to the nearby dumping center.User will be getting the list of all the dumping sites as well. 3.Donate - This section includes the donation of the clothes or others accessories to the nearby centre or NGOs. 4.Report - This section inludes tracing and treatment of random waste(accidental waste, stationary waste, etc.)"
                      .text
                      .color(Colors.white)
                      .make(),
                  SizedBox(
                    height: 10,
                  ),
                  "Target Pool: All houses in India."
                      .text
                      .color(Colors.white)
                      .make(),
                  SizedBox(
                    height: 10,
                  ),
                  "Mode of Operation : Hybrid".text.color(Colors.white).make(),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  "Contact Us".text.bold.color(Colors.white).xl2.make(),
                  SizedBox(
                    height: 10,
                  ),
                  "Email ID - xyz@gmail.com".text.color(Colors.white).make(),
                  SizedBox(
                    height: 10,
                  ),
                  "Toll Free No. - 050650512".text.color(Colors.white).make(),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
        //   replacement: const Center(
        //     child: CircularProgressIndicator(),
        //   ),
        // ),
      ),
    );
  }
}
