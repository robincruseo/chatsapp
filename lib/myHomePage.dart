import 'package:chatsapp/app/app.dart';
import 'package:chatsapp/app_config.dart';
import 'package:chatsapp/screens/call.dart' as fourth;
import 'package:chatsapp/screens/camera.dart' as first;
import 'package:chatsapp/screens/chat.dart' as second;
import 'package:chatsapp/screens/stories.dart' as third;
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'app/app.dart';
import 'models/chatModel.dart';
//import 'app/appEngine.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int tabPosition;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(setActiveTabPosition);

    super.initState();
  }

  void setActiveTabPosition() {
    tabPosition = tabController.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: tabBody(),
    );
  }

  myAppBar() {
    return AppBar(
      backgroundColor: AppConfig.appColor,
      title: Text(
        "ChatsApp",
        style:
            TextStyle(color: white, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
            icon: Icon(
              Icons.search,
              size: 25,
            ),
            onPressed: () {}),
        chatDialog(),
      ],
      bottom: PreferredSize(
        preferredSize: new Size(50, 50),
        child: TabBar(
          tabs: [
            Tab(
                icon: Icon(
              Icons.photo_camera,
              color: Colors.white,
              size: 25,
            )),
            Tab(
              child: Text(
                "CHATS",
                style: TextStyle(
                    color: white, fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                "STATUS",
                style: TextStyle(
                    color: white, fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                "CALLS",
                style: TextStyle(
                    color: white, fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
          onTap: (p) {
            setState(() {
              tabPosition = p;
            });
          },
          indicatorColor: Colors.white,
          controller: tabController,
          indicatorWeight: 4,
//          indicatorSize: ,
          unselectedLabelColor: AppConfig.appColor,
          labelColor: AppConfig.appColor.withOpacity(.5),
        ),
      ),
    );
  }

  tabBody() => TabBarView(controller: tabController, children: <Widget>[
        first.Camera(),
        second.Chat(),
        third.Stories(),
        fourth.Call()
      ]);

  chatDialog() {
    return PopupMenuButton<String>(
      padding: EdgeInsets.all(0),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onSelected: choiceAction,
      icon: Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) {
        List<String> popups = Constants.chatDiaglog;
        if (tabPosition == 2) popups = Constants.statusSettings;
        if (tabPosition == 3) popups = Constants.callSettings;

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
