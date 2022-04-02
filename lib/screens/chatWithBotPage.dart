import "package:flutter/material.dart";

class ChatWithBotPage extends StatefulWidget {
  const ChatWithBotPage({Key? key}) : super(key: key);

  @override
  State<ChatWithBotPage> createState() => _ChatWithBotPageState();
}

class _ChatWithBotPageState extends State<ChatWithBotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HealthCare Assistant"),
      ),
      body: Container(),
    );
  }
}
