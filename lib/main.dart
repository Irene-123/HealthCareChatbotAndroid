import 'package:flutter/material.dart';
import 'package:health_care_chatbot/screens/home_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(!Firebase.apps.isEmpty){
    await Firebase.initializeApp(
      name: "HCchatbot",
      options: const FirebaseOptions(
          apiKey: "AAAAXeuC-4s:APA91bFOiut0k1SCE_3DyNbfUUXwjh1hSrpHnB-_kaIRtD5n48xlUUiqRgzRv4ARQQXqMv1zDvhqjvSG3Dsk69J0d_3M7Vkt4X295bTT3IGuyk8VYIQVB7yqxKi0rKLb2CWty0MHUzaZ",
          appId: "1:403383188363:android:27da9be8aa20dfaeff8d8e",
          messagingSenderId: "403383188363",
          projectId: "healthcarechatbot-a8a33",
          databaseURL: "https://healthcarechatbot-a8a33-default-rtdb.asia-southeast1.firebasedatabase.app/"
      ),
    );
  }
  else{
    await Firebase.app('HCchatbot');
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  final dbRef = FirebaseDatabase.instance.ref();

  Widget build(BuildContext context) {
    dbRef.push().set({'name': "Anshul", 'comment': 'A good season'});
    return const MaterialApp(
      title: 'Startup Name Generator',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}