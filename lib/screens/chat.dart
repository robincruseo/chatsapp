import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatsapp/app/app.dart';
import 'package:chatsapp/models/chatModel.dart';
import 'package:chatsapp/screens/directMessage.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  final ChatModel model;

  const Chat({Key key, this.model}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  ChatModel model;

  @override
  initState() {
    super.initState();
    model = widget.model;
  }

  List<ChatModel> fakeChats = [
    ChatModel("James St Patric", "https://tinyurl.com/y9a8lf2v", "how far"),
    ChatModel("Chinagozi", "https://tinyurl.com/y97pp5l4",
        "it's true i did not factor that in... the only thing i factored was putting . at the end of each statement"),
    ChatModel("Maugost", "https://tinyurl.com/ybforkvw",
        "Check the first word in most of them were in small letters"),
    ChatModel("Ann", "https://tinyurl.com/y7joxgux",
        "hw are you doing today? \ntrust u had a good night rest"),
    ChatModel("Lydia", "https://tinyurl.com/ycah4b82",
        "pls i want to learn, how does one play keyboard or guiitar remotely🤔"),
    ChatModel("Precious", "https://tinyurl.com/y7zn6qyf",
        "So am thinking for doing it on a platform so its look presentable"),
    ChatModel("goodluck", "https://tinyurl.com/y8zydrsy",
        "Thank you so much for the bday wishes yesterday...e totori me.God bless you for me🙏"),
    ChatModel("James", "https://tinyurl.com/y9a8lf2v", "how far"),
    ChatModel("peter", "https://tinyurl.com/y97pp5l4",
        "it's true i did not factor that in... the only thing i factored was putting . at the end of each statement"),
    ChatModel("precious int'l", "https://tinyurl.com/ybforkvw",
        "Check the first word in most of them were in small letters"),
    ChatModel("Irene", "https://tinyurl.com/y7joxgux",
        "hw are you doing today? \ntrust u had a good night rest"),
    ChatModel("Esther", "https://tinyurl.com/ycah4b82",
        "pls i want to learn, how does one play keyboard or guiitar remotely🤔"),
    ChatModel("Amara", "https://tinyurl.com/y7zn6qyf",
        "So am thinking for doing it on a platform so its look presentable"),
    ChatModel("Esther A.", "https://tinyurl.com/y8zydrsy",
        "Thank you so much for the bday wishes yesterday...e totori me.God bless you for me🙏"),
    ChatModel("Maureen", "https://tinyurl.com/y86wfz89",
        "happy birthday Mr Logic. may you never know want. continue to grow in grace"),
    ChatModel("nonso", "https://tinyurl.com/y86wfz89",
        "happy birthday Mr Logic. may you never know want. continue to grow in grace"),
    ChatModel("Christian", "",
        "happy birthday Mr christy. may you never know want. continue to grow in grace"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (ctx, p) {
        final chat = fakeChats[p];

        return InkWell(
          onTap: () {
            pushAndResult(
                context,
                DirectMessage(
                  model: chat,
                ));
          },
          onLongPress: () {},
          child: Container(
            color: white.withAlpha(3),
            margin: EdgeInsets.fromLTRB(8, 8, 10, 5),
//          decoration: BoxDecoration(color: red0),
            child: Row(
              children: [
                Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: black.withOpacity(0.3)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: chat.imagePath.isEmpty
                          ? Icon(
                              Icons.person,
                              size: 45,
                              color: white.withOpacity(.5),
                            )
                          : CachedNetworkImage(
                              imageUrl: chat.imagePath,
                              fit: BoxFit.cover,
                              height: 80,
                              width: 80,
                            ),
                    )),
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
                        style: TextStyle(
                            color: black.withOpacity(.8),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        chat.message,
                        maxLines: 1,
                        style: TextStyle(
                            color: black.withOpacity(.9),
//                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        );
      },
      itemCount: fakeChats.length,
    );
  }
}
