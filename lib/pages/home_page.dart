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
