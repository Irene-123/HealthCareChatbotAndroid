import 'package:flutter/material.dart';
import 'package:health_care_chatbot/screens/homePage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }








  final databaseRef = FirebaseDatabase.instance; //database reference object

  private DatabaseReference mDatabase;
// ...
  mDatabase = FirebaseDatabase.getInstance().getReference();