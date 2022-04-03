import 'package:flutter/material.dart';
import 'package:health_care_chatbot/screens/home_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

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
    print(ref.key);
    print(ref.parent!.key);
    ref.remove();

    return const MaterialApp(
      title: 'Startup Name Generator',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}