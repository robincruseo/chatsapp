import 'package:chatsapp/app/app.dart';
import 'package:chatsapp/app_config.dart';
import 'package:chatsapp/screens/call.dart' as fourth;
import 'package:chatsapp/screens/camera.dart' as first;
import 'package:chatsapp/screens/chat.dart' as second;
import 'package:chatsapp/screens/stories.dart' as third;
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/appEngine.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: tabBody(),
    );
  }

  myAppBar() => AppBar(
        backgroundColor: AppConfig.appColor,
        title: Text(
          "ChatsApp",
          style: textStyle(true, 25, white),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                size: 25,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.more_vert,
                size: 25,
              ),
              onPressed: () {}),
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
                  style: textStyle(true, 15, white),
                ),
              ),
              Tab(
                child: Text(
                  "STATUS",
                  style: textStyle(true, 15, white),
                ),
              ),
              Tab(
                child: Text(
                  "CALLS",
                  style: textStyle(true, 15, white),
                ),
              ),
            ],
            indicatorColor: Colors.white,
            controller: tabController,
            indicatorWeight: 4,
//          indicatorSize: ,
            unselectedLabelColor: AppConfig.appColor,
            labelColor: AppConfig.appColor.withOpacity(.5),
          ),
        ),
      );

  tabBody() => TabBarView(controller: tabController, children: <Widget>[
        first.Camera(),
        second.Chat(),
        third.Stories(),
        fourth.Call()
      ]);
}
