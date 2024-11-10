import 'package:coffee_shop/View/screen/btmNavBar.dart';
import 'package:coffee_shop/View/screen/startPage.dart';
import 'package:coffee_shop/bindings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCC6ajKRxL4VR1YKuRVgmxIpd6hf4Wi1r8",
          appId: "1:350567070581:android:9238f4b5ac31c8aa37313c",
          messagingSenderId: "350567070581",
          projectId: "flutterfirebasecoursesss"));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: bindings(),
        debugShowCheckedModeBanner: false,
        home: (FirebaseAuth.instance.currentUser != null)
            ? btmnavbar()
            : coffeeshopstarttt());
  }
}
