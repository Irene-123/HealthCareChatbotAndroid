import 'package:flutter/material.dart';
import 'package:health_care_chatbot/screens/home_page.dart';
import 'package:health_care_chatbot/screens/chat_with_bot_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire_cli/flutterfire_cli.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:async';
import 'dart:ui';


void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  final dbRef = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL: "https://healthcarechatbot-a8a33-default-rtdb.asia-southeast1.firebasedatabase.app/"
  );

  Widget build(BuildContext context) {

    DatabaseReference ref = dbRef.ref("username/1");
    // print(ref.key);
    // print(ref.parent!.key);
    ref.remove();

    return const MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      home: HomePage(),

    );
  }
}