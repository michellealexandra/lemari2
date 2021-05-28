import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lemari2/ui/pages.dart';
import 'package:lemari2/ui/splash.dart';
//import manual klo dari folder lain
// import 'package:lemari2/ui/dashboard/dashboard.dart';

void enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isAndroid || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() async {
  enablePlatformOverrideForDesktop();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Lemari",
      theme: ThemeData(
        primaryColor: Color(0xffE3B68D),
        primaryColorLight: Color(0xffD6AA8E),
        accentColor: Color(0xff5D4736),
        primarySwatch: Colors.brown,
      ),
      home: Splash(),
      initialRoute: '/',
      routes: {
        // '/':(context) => Login(),
        //cara panggil modular, shg ga perlu rename satu", jd klo misal keganti routename nya lgs ke ganti

        Splash.routeName: (context) => Splash(),
        Login.routeName: (context) => Login(),
        Register.routeName: (context) => Register(),
        Dashboard.routeName: (context) => Dashboard(),
        Lemari.routeName: (context) => Lemari(),
        Profile.routeName: (context) => Profile(),
        MainMenu.routeName: (context) => MainMenu(),
        DetailClothes.routeName: (context) => DetailClothes(),
        AddCloset.routeName: (context) => AddCloset(),
        AddClothes.routeName: (context) => AddClothes(),
        GridClothes.routeName: (context) => GridClothes(),
        EditProfile.routeName: (context) => EditProfile(),
        EditCloset.routeName: (context) => EditCloset(),
        EditClothes.routeName: (context) => EditClothes(),
      },
    );
  }
}
