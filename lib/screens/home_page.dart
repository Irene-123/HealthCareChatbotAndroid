
import 'package:flutter/material.dart';
import 'package:health_care_chatbot/screens/chat_with_bot_page.dart';
import 'package:health_care_chatbot/screens/user_history.dart';
import 'package:health_care_chatbot/screens/user_profile.dart';
import 'package:health_care_chatbot/function.dart';

import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List _children = [
    const UserProfile(),
    const ChatWithBotPage(),
    const UserHistory()
  ];
  String url = '';
  var data;
  String output = 'Initial Output';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _children[_currentIndex],
      // Center(
      //   child: Container(
      //     padding: EdgeInsets.all(20),
      //     child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      //       TextField(
      //         onChanged: (value) {
      //           url = 'http://10.0.2.2:5000/api?query=' + value.toString();
      //         },
      //       ),
      //       TextButton(
      //           onPressed: () async {
      //             data = await fetchdata(url);
      //             var decoded = jsonDecode(data);
      //             setState(() {
      //               output = decoded['output'];
      //             });
      //            },
      //           child: Text(
      //             'Fetch ASCII Value',
      //             style: TextStyle(fontSize: 20),
      //           )),
      //       Text(
      //         output,
      //         style: TextStyle(fontSize: 40, color: Colors.green),
      //       )
      //     ]),
      //   ),
      // ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),
        ],
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
