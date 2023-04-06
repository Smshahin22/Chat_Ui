import 'package:chat_ui/models/chat_model.dart';
import 'package:chat_ui/utils.dart';
import 'package:chat_ui/widgets/message_widget.dart';

import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      bottomNavigationBar: _chatTextfield(),
      body: Column(
        children: [
          const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: greyColor,
                  radius: 26,
                  backgroundImage: const AssetImage('assets/images/profile2.png'),
                ),
                const SizedBox(width: 18,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Shahriar Shahin',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text("Online",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white
                    ),)
                  ],
                ),
                const Spacer(),
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.call,
                  color: Colors.grey,),

                )
              ],
            ),
          ),

          const SizedBox(height: 40,),

          Expanded(child: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5))
            ),
            child: ListView.separated(
                itemBuilder: (context, index) => MessageBubble(message: messages[index],),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 8,),
                itemCount: messages.length),
          ))
        ],
      ),
    );

  }
  Widget _chatTextfield() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 14,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20),
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.green
        ),
        child: Row(
          children: const [
            Expanded(child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your message',
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.white
                )
              ),
            )),

              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.send,
                color: Colors.black,),
              ),

          ],
        ),
      ),
    );
  }
}
