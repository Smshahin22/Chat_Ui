import 'package:chat_ui/models/chat_model.dart';
import 'package:chat_ui/utils.dart';
import 'package:flutter/cupertino.dart';

class MessageBubble extends StatefulWidget {
  final Message message;
  const MessageBubble({Key? key, required this.message}) : super(key: key);

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  bool showTimeS = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: widget.message.received ? Alignment.centerLeft : Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  showTimeS=!showTimeS;
                });
              },
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: widget.message.received ? greyColor : peachColor
                ),
                child: Text(widget.message.text,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                ),
                ),
                ),
            ),
            const SizedBox(height: 8,),
               if(showTimeS)...[
                 Padding(
                 padding: const EdgeInsets.only(right: 12),
                 child: Text(widget.message.timeStamp,
              style: const TextStyle(
                  fontSize: 12,
              ),
            ),
               ),
               ]

          ],
        ),
      ),
    );
  }
}
