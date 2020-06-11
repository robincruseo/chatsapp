import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_bubble/chat_bubble.dart';
import 'package:chatsapp/app/app.dart';
import 'package:chatsapp/app_config.dart';
import 'package:chatsapp/models/chatModel.dart';
import 'package:flutter/material.dart';

class DirectMessage extends StatefulWidget {
  final ChatModel model;

  const DirectMessage({Key key, this.model}) : super(key: key);

  @override
  _DirectMessageState createState() => _DirectMessageState();
}

class _DirectMessageState extends State<DirectMessage> {
  ChatModel model;

  @override
  initState() {
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageBody(),
    );
  }

  pageBody() {
    return Column(
      children: [
        dmAppBar(),
        messageBody(),
      ],
    );
  }

  dmAppBar() {
    return Container(
        padding: EdgeInsets.only(top: 35, right: 0, left: 0),
        height: 100,
        color: AppConfig.appColor,
        child: Row(
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: black.withOpacity(0.3)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: model.imagePath.isEmpty
                          ? Icon(
                              Icons.person,
                              size: 35,
                              color: white.withOpacity(.5),
                            )
                          : CachedNetworkImage(
                              imageUrl: model.imagePath, //chat.imagePath,
                              fit: BoxFit.cover,
                              height: 45,
                              width: 45,
                            ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: Text(
                      model.profileName,
                      //maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.videocam,
                  color: white,
                  size: 30,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.call, color: white, size: 30),
                onPressed: () {}),
            chatDialog()
          ],
        ));
  }

  messageBody() {
    return Flexible(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(wallpaper), fit: BoxFit.cover)),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (ct, p) {
                bool myItem = (p % 3) == 0;

                if (myItem)
                  return chatOutGoing();
                else
                  return chatIncoming();
              })
        ],
      ),
    );
  }

  chatIncoming() {
    return Container(
      //padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 80, left: 10, top: 10, bottom: 10),
      child: ChatBubble(
          radius: 10,
          nipTop: 10,
          direction: ChatBubbleNipDirection.LEFT,
//          nipLength: 100,
          child: Container(
            color: AppConfig.appColor.withOpacity(.5),
            padding: const EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Container(
                    child: Text(
                      model.message,
                      textWidthBasis: TextWidthBasis.longestLine,
                      maxLines: 10,
                      style: TextStyle(color: black),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: Text(
                    "10:42 am",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                )
              ],
            ),
          )),
    );
  }

  chatOutGoing() {
    return Container(
      //padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 10, left: 80, top: 10, bottom: 10),
      child: ChatBubble(
          radius: 10,
          nipTop: 10,
          direction: ChatBubbleNipDirection.RIGHT,
          child: Container(
            padding: const EdgeInsets.all(18),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(
                    child: Text(
                      model.message,
                      textWidthBasis: TextWidthBasis.longestLine,
                      maxLines: 10,
                      style: TextStyle(color: black),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: Text(
                    "10:42 am",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                )
              ],
            ),
          )),
    );
  }

  chatDialog() {
    return PopupMenuButton<String>(
      padding: EdgeInsets.all(0),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onSelected: choiceAction,
      icon: Icon(
        Icons.more_vert,
        color: white,
        size: 30,
      ),
      itemBuilder: (BuildContext context) {
        List<String> popups = Constants.dmSettings;

        return popups.map((String chatDialog) {
          return PopupMenuItem<String>(
            value: chatDialog,
            child: Text(chatDialog),
          );
        }).toList();
      },
    );
  }

  void choiceAction(String chatDialog) {
    if (chatDialog == Constants.directMessage) {
      print('Settings');
    }
    if (chatDialog == Constants.groupMessage) {
      print('Subscribe');
    }
    if (chatDialog == Constants.Settings) {
      print('SignOut');
    }
  }
}
