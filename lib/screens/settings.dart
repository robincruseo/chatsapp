import 'package:chatsapp/app/app.dart';
import 'package:chatsapp/app_config.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  itemCheckView({
    title,
    subTitle,
    active,
    onClicked,
  }) {
    return InkWell(
      onTap: () {
        onClicked(!active);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        title,
//                        style: textStyle(false, 16, Colors.black),
                      ),
//                      addSpace(5),
                      Text(
                        subTitle,
//                        style: textStyle(false, 12, Colors.grey),
                      ),
//                      addSpace(10),
                    ],
                  ),
                ),
                Switch(
                    value: active,
                    activeColor: AppConfig.appColor,
                    onChanged: (_) {
                      onClicked();
                    }),
              ],
            ),
          ),
//          addLine(1, Colors.black.withOpacity(.04), 0, 0, 0, 0),
        ],
      ),
    );
  }

  itemView(title, items, onClicked, {bool showAdmin = false, onAdminClicked}) {
    return Container(
      //color: Colors.grey[50],
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              height: 60,
              //color: Colors.white,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 15),
              child: Text(
                title,
//                style: textStyle(true, 16, black.withOpacity(.7)),
              )),
          if (showAdmin)
            InkWell(
              onTap: onAdminClicked,
              splashColor: Colors.green[800],
              highlightColor: Colors.green[800],
              child: Ink(
                color: Colors.red,
                child: Container(
                    height: 60,
                    //color: Colors.red,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Admin Portal",
                          style: TextStyle(fontSize: 18, color: black),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: black,
                        )
                      ],
                    )),
              ),
            ),
          Divider(
            height: 1,
            color: white.withOpacity(0.1),
          ),
          ...List.generate(items.length, (index) {
            return InkWell(
              onTap: () {
                onClicked(index);
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      //height: 50,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            items[index],
//                              style: textStyle(false, 16, black)
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: black.withOpacity(.4),
                          )
                        ],
                      ),
                    ),
//                    addLine(1, black.withOpacity(.04), 0, 0, 0, 0)
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, "");
        return false;
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text("Settings"),
        ),
        //backgroundColor: AppConfig.appColor,
        backgroundColor: white,
        body: ListView(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.only(bottom: 60),
          children: <Widget>[
            itemCheckView(
                title: "push notification",
                subTitle: userModel.pushNotifications ? "enabled" : "disabled",
                active: userModel.pushNotifications,
                onClicked: (v) {
                  userModel
                    ..put(PUSH_NOTIFICATIONS, v)
                    ..updateItems();
                  setState(() {});
                }),
            itemCheckView(
                title: "SMS Notifications",
                subTitle: userModel.smsNotifications ? "enabled" : "disabled",
                active: userModel.smsNotifications,
                onClicked: (v) {
                  userModel
                    ..put(SMS_NOTIFICATIONS, v)
                    ..updateItems();
                  setState(() {});
                }),
            itemCheckView(
                title: "Email Notifications",
                subTitle: userModel.emailNotifications ? "enabled" : "disabled",
                active: userModel.emailNotifications,
                onClicked: (v) {
                  userModel
                    ..put(SMS_NOTIFICATIONS, v)
                    ..updateItems();
                  setState(() {});
                }),
            itemView(
              "App & Settings",
              [
                "Share App",
                "Rate App",
                "About App",
              ],
              (p) {
                return;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
//                  logout();
                },
                child: Container(
                  padding: 10.padAll(),
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppConfig.appColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/logout.png",
                          height: 25,
                          width: 25,
                          color: white,
                        ),
//                        addSpaceWidth(5),
                        Text(
                          "LOGOUT",
//                          style: textStyle(true, 17, white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//  void logout() async {
//    showMessage(
//      context,
//      Icons.exit_to_app,
//      red0,
//      "Logout?",
//      "Are you sure you want to Logout?",
//      clickYesText: "Logout",
//      cancellable: true,
//      onClicked: (_) {
////        createBasicListeners(
////            suspend: true,
////            redirectBack: () {
////              popUpWidgetScreenUntil(context, Welcome());
////            });
//      },
//    );
//  }
}
