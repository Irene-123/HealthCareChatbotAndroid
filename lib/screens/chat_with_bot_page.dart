import 'dart:async';
import 'dart:convert';
import "package:flutter/material.dart";
import '../models/chatMessageModel.dart';
import 'package:health_care_chatbot/function.dart';
import 'package:http/http.dart' as http;

class ChatWithBotPage extends StatefulWidget {
  const ChatWithBotPage({Key? key}) : super(key: key);

  @override
  State<ChatWithBotPage> createState() => _ChatWithBotPageState();
}

class _ChatWithBotPageState extends State<ChatWithBotPage> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];
  final textBoxController = TextEditingController();
  final ScrollController _controller = ScrollController();
   String url = 'http://10.0.2.2:5000/api?query=';
  var data;
  String output = 'Initial Output';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.redAccent,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back,color: Colors.white,),
                ),
                const SizedBox(width: 2,),
                const CircleAvatar(
                  // backgroundImage: NetworkImage("<https://randomuser.me/api/portraits/men/5.jpg>"),
                  backgroundImage: AssetImage('assets/images/bot.jpg'),
                  maxRadius: 20,
                ),
                const SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text("Noni BOT",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600, color: Colors.white),),
                      SizedBox(height: 6,),
                      Text("Online",style: TextStyle(color: Colors.white, fontSize: 13),),
                    ],
                  ),
                ),
                const Icon(Icons.settings,color: Colors.white,),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            controller: _controller,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10,bottom: 60),
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Container(
                padding: const EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType  == "receiver"?Colors.red.shade200:Colors.grey.shade200),
                    ),
                  padding: const EdgeInsets.all(16),
                  child: Text(messages[index].messageContent, style: const TextStyle(fontSize: 15))
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 20, ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      controller: textBoxController,

                      decoration: const InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.send,
                      onSubmitted: (msg){
                        output=this._getResponse();
                      },
                    ),
                  ),
                  const SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        messages.add(
                            ChatMessage(
                                messageContent: textBoxController.text,
                                messageType: "sender"
                            )
                        );
                        Timer(
                            Duration(milliseconds: 300),
                                () => _controller
                                .jumpTo(_controller.position.maxScrollExtent));
                      });
                      setState(() {
                        messages.add(
                            ChatMessage(
                                messageContent: output,
                                messageType: "receiver"
                            )
                        );
                        Timer(
                            Duration(milliseconds: 300),
                                () => _controller
                                .jumpTo(_controller.position.maxScrollExtent));
                      });

                      textBoxController.clear();
                    },
                    child: const Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.redAccent ,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getResponse(){
    if (textBoxController.text.length>0){
      data= textBoxController.text;
      url = 'http://10.0.2.2:5000/api?query=' + data.toString();
      data =  fetchdata(url);
      var decoded = jsonDecode(data);
      output = decoded['output'];
      setState(() {
        messages.add(
            ChatMessage(
                messageContent: output,
                messageType: "receiver"
            )
        );
      });
    }
    return output;
  }

}


