import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatsapp/app/app.dart';
import 'package:chatsapp/app/appEngine.dart';
import 'package:chatsapp/models/chatModel.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<ChatModel> fakeChats = [
    ChatModel("James St Patric", "https://tinyurl.com/ybysz7cj", "how far"),
    ChatModel("Chinagozi", "https://tinyurl.com/y97pp5l4",
        "it's true i did not factor that in... the only thing i factored was putting . at the end of each statement"),
    ChatModel("Maugost", "https://tinyurl.com/ybforkvw",
        "Check the first word in most of them were in small letters"),
    ChatModel("Ann", "https://tinyurl.com/y78t4wks",
        "hw are you doing today? \ntrust u had a good night rest"),
    ChatModel("Lydia", "https://tinyurl.com/ycah4b82",
        "pls i want to learn, how does one play keyboard or guiitar remotely🤔"),
    ChatModel("Precious", "https://tinyurl.com/y7zn6qyf",
        "So am thinking for doing it on a platform so its look presentable"),
    ChatModel("goodluck", "https://tinyurl.com/y8zydrsy",
        "Thank you so much for the bday wishes yesterday...e totori me.God bless you for me🙏"),
    ChatModel("Mary", "https://tinyurl.com/y86wfz89",
        "happy birthday Mr Logic. may you never know want. continue to grow in grace"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (ctx, p) {
        final chat = fakeChats[p];

        return Container(
          margin: EdgeInsets.all(8),
//          decoration: BoxDecoration(color: red0),
          child: Row(
            children: [
              Flexible(
                child: Container(
                    margin: EdgeInsets.all(5),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: black.withOpacity(0.3)),
                    child: CachedNetworkImage(
                      imageUrl: chat.imagePath,
                      fit: BoxFit.cover,
                    )
//                  Icon(
//                    Icons.person,
//                    size: 45,
//                    color: white.withOpacity(.5),
//                  ),
                    ),
              ),
              SizedBox(
                width: 7,
              ),
              Flexible(
                  child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.profileName,
                      style: textStyle(true, 18, black.withOpacity(.7)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      chat.message,
                      maxLines: 1,
                      style: textStyle(
                        false,
                        16,
                        black.withOpacity(.7),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        );
      },
      itemCount: fakeChats.length,
    );
  }
}
