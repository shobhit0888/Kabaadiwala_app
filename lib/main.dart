// ignore_for_file: deprecated_member_use

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kabaadiwala/pages/login_page.dart';
import 'package:kabaadiwala/widgets/themes.dart';
import 'package:page_transition/page_transition.dart';
import 'package:velocity_x/velocity_x.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
  await Firebase.initializeApp();
  if (defaultTargetPlatform == TargetPlatform.android) {
AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  runApp(const Kabaadiwala());
}

class Kabaadiwala extends StatelessWidget {
  const Kabaadiwala({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,  
      home: AnimatedSplashScreen(
        splash: 'assets/images/main_img.jpg',
        splashIconSize: 400,
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        backgroundColor: Colors.black,
        nextScreen: LoginPage(),
      ),
    );
    // MaterialApp(
    //   themeMode: ThemeMode.system,
    //   theme: MyTheme.lightTheme(context),
    //   darkTheme: MyTheme.darkTheme(context),
    
    //

    //   // initialRoute: MyRoutes.loginRoute,
    //   routes: {
    //     "/": (context) => LoginPage(),
    //     // MyRoutes.homeRoute: (context) => HomePage(),
    //     // MyRoutes.loginRoute: (context) => LoginPage(),
    //     // MyRoutes.cartRoute: (context) => CartPage(),
    //   },
    // );
  }
}
