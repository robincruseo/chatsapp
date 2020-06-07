//import 'dart:io';
//
//import 'package:cached_network_image/cached_network_image.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';
//import 'package:flutter_inner_drawer/inner_drawer.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:synchronized/synchronized.dart';
//import 'package:translator/translator.dart';
//import 'package:whatsapp_clone/app_config.dart';
//import 'package:whatsapp_clone/screens/welcome.dart';
//import 'package:whatsapp_clone/settings.dart';
//
//import 'app/app.dart';
//import 'show_profile.dart';
//
//class AppIndex extends StatefulWidget {
//  @override
//  _AppIndexState createState() => _AppIndexState();
//}
//
//class _AppIndexState extends State<AppIndex>
//    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
//  final drawerKey = GlobalKey<InnerDrawerState>();
//  bool drawerOpened = false;
//  AnimationController animationController;
//  List subs = [];
////  void _toggle() {
////    drawerKey.currentState.toggle(direction: InnerDrawerDirection.start);
////  }
//
//  final vp = PageController();
//  int currentPage = 0;
//  var scaffoldKey = GlobalKey<ScaffoldState>();
//
//  @override
//  void dispose() {
//    // TODO: implement dispose
//    super.dispose();
//    WidgetsBinding.instance.removeObserver(this);
//    for (var sub in subs) sub.cancel();
//  }
//
//  @override
////  initState() {
////    super.initState();
////    WidgetsBinding.instance.addObserver(this);
////    createBasicListeners(redirectBack: () {
////      popUpWidgetScreenUntil(context, Welcome());
////    }, setUpMethods: () async {
//////      if (mounted) {
//////        loadMyFollowers();
//////        loadAmFollowing();
//////      }
////
//////      if (hasSetup) return;
//////      loadNotificationsSettings();
//////      loadFCMSettings();
//////      checkInterests();
//////      loadAppPartners();
////
//////      await lockSync.synchronized(() async {
//////
//////      });
//////      loadNotes();
//////      loadPosts();
//////      loadStories();
//////      loadMyNotifications();
//////      loadMessages();
////      if (mounted)
////        setState(() {
////          hasSetup = true;
////        });
////    });
////  }
//
//  @override
//  void didChangeAppLifecycleState(AppLifecycleState state) {
//    // TODO: implement didChangeAppLifecycleState
//    if (state == AppLifecycleState.paused) {
//      onPause();
//    }
//    if (state == AppLifecycleState.resumed) {
//      onResume();
//    }
//    super.didChangeAppLifecycleState(state);
//  }
//
//  void onPause() {
//    if (userModel == null) return;
//    int prevTimeOnline = userModel.getInt(TIME_ONLINE);
//    int timeActive = (DateTime.now().millisecondsSinceEpoch) - timeOnline;
//    int newTimeOnline = timeActive + prevTimeOnline;
//    userModel.put(IS_ONLINE, false);
//    userModel.put(TIME_ONLINE, newTimeOnline);
//    userModel.updateItems();
//    timeOnline = 0;
//  }
//
//  void onResume() async {
//    if (userModel == null) return;
////    checkTime();
//    timeOnline = DateTime.now().millisecondsSinceEpoch;
//    userModel.put(IS_ONLINE, true);
//    userModel.put(
//        PLATFORM, Platform.isAndroid ? ANDROID : Platform.isIOS ? IOS : WEB);
////    if (!userModel.getBoolean(NEW_APP)) {
////      userModel.put(NEW_APP, true);
////    }
//    userModel.updateItems();
//
////    Future.delayed(Duration(seconds: 2), () {
////      checkLaunch();
////    });
//  }
//
//  loadNotificationsSettings() async {
//    notificationsPlugin = FlutterLocalNotificationsPlugin();
//    var androidSettings = AndroidInitializationSettings('ic_launcher');
//    var iosSettings = IOSInitializationSettings(
//        requestSoundPermission: false,
//        requestBadgePermission: false,
//        requestAlertPermission: false,
//        onDidReceiveLocalNotification:
//            (int id, String title, String body, String payload) async {
//          print(payload);
//        });
//
//    var initializationSettings =
//        InitializationSettings(androidSettings, iosSettings);
//    await notificationsPlugin.initialize(initializationSettings,
//        onSelectNotification: (String payload) async {});
//
//    if (Platform.isIOS) {
//      var result = await notificationsPlugin
//          .resolvePlatformSpecificImplementation<
//              IOSFlutterLocalNotificationsPlugin>()
//          ?.requestPermissions(
//            alert: true,
//            badge: true,
//            sound: true,
//          );
//      print("Permission result $result");
//    }
//  }
//
//  loadFCMSettings() async {
//    final fbMessaging = FirebaseMessaging();
//    fbMessaging.configure(
//      onMessage: notificationOnMessage,
//      onLaunch: notificationOnLaunch,
//      onResume: notificationOnResume,
//    );
//    fbMessaging.setAutoInitEnabled(true);
//    fbMessaging.requestNotificationPermissions(
//        const IosNotificationSettings(sound: true, badge: true, alert: true));
//    fbMessaging.onIosSettingsRegistered
//        .listen((IosNotificationSettings settings) {
//      print(settings);
//    });
//    fbMessaging.getToken().then((String token) async {
//      if (null == token) return;
//      userModel
//        ..put(PUSH_TOKEN, token)
//        ..updateItems();
//    });
//
//    fbMessaging.onTokenRefresh.listen((token) async {
//      if (null == token) return;
//      userModel
//        ..put(PUSH_TOKEN, token)
//        ..updateItems();
//    });
//  }
//
//  Future notificationOnMessage(Map<String, dynamic> message) async {
//    BaseModel model = BaseModel(items: message);
//    await showNotification(model);
//  }
//
//  Future notificationOnResume(Map<String, dynamic> message) async {
//    BaseModel model = BaseModel(items: message);
//    await showNotification(model);
//  }
//
//  Future notificationOnLaunch(Map<String, dynamic> message) async {
//    BaseModel model = BaseModel(items: message);
//    await showNotification(model);
//  }
//
//  showNotification(BaseModel model) async {
//    String title = model.getString("title");
//    String message = model.getString("message");
//    String notifiedId = model.getString("notifiedId");
//
//    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//        'arab.maugost.nt', 'Maugost', 'your channel description',
//        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
//    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//    var platformChannelSpecifics = NotificationDetails(
//        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//    await notificationsPlugin.show(0, title, message, platformChannelSpecifics,
//        payload: 'item x');
//
//    print("Shown...");
//  }
//
////  loadNotifyType(BaseModel model) {
////    int type = model.getType();
////    String database;
////    if (type == NOTIFY_TYPE_POST) database = POST_BASE;
////    if (type == NOTIFY_TYPE_COMMENT) database = COMMENT_BASE;
////    if (type == NOTIFY_TYPE_STORY) database = STORY_BASE;
////    if (type == NOTIFY_TYPE_FOLLOW) database = USER_BASE;
////
////    String notifiedId = model.notifiedId;
////
////    if (notifiedId.isEmpty) return;
////
////    Firestore.instance
////        .collection(database)
////        .document(notifiedId)
////        .get()
////        .then((doc) {
////      BaseModel notifyThis = BaseModel(doc: doc);
////
////      if (type == NOTIFY_TYPE_FOLLOW) {
////        pushAndResult(
////            context,
////            ShowProfile(
////              thisUser: notifyThis,
////            ));
////        return;
////      }
////
////      if (type == NOTIFY_TYPE_POST ||
////          type == NOTIFY_TYPE_COMMENT ||
////          type == NOTIFY_TYPE_REPLY) {
////        pushAndResult(
////            context,
////            ShowComments(
////              thisPost: notifyThis,
////            ));
////        return;
////      }
////    });
////  }
//
//
//  loadAppPartners() async {
//    Firestore.instance
//        .collection(PARTNER_BASE)
//        //.where(USER_ID, isEqualTo: userModel.getUserId())
//        .getDocuments()
//        .then((value) {
//      for (var doc in value.documents) {
//        BaseModel model = BaseModel(doc: doc);
//        if (mounted)
//          setState(() {
//            appPartners.addModel(model, sort: true);
//            partnersLoaded = true;
//          });
//      }
//      if (mounted)
//        setState(() {
//          partnersLoaded = true;
//        });
//    });
//  }
//
//  loadNotes() async {
//    final lockSync = Lock();
//    await lockSync.synchronized(() async {
//      Firestore.instance
//          .collection(NOTE_BASE)
//          .where(USER_ID, isEqualTo: userModel.getUserId())
//          .snapshots()
//          .listen((value) {
//        for (var doc in value.documents) {
//          BaseModel model = BaseModel(doc: doc);
//          if (mounted)
//            setState(() {
//              myNotes.addModel(model, sort: true);
//              notesLoaded = true;
//            });
//        }
//        if (mounted)
//          setState(() {
//            notesLoaded = true;
//          });
//      });
//    });
//  }
//
//  loadMyNotifications() async {
//    final lockSync = Lock();
//    await lockSync.synchronized(() async {
//      Firestore.instance
//          .collection(NOTIFY_BASE)
//          .where(PARTIES, arrayContains: userModel.getUserId())
//          .orderBy(CREATED_AT, descending: false)
//          .snapshots()
//          .listen((event) {
//        for (var doc in event.documentChanges) {
//          BaseModel model = BaseModel(doc: doc.document);
//          if (doc.type == DocumentChangeType.removed) {
//            myNotifications.removeModel(model.getObjectId());
//            continue;
//          }
//          myNotifications.addModel(model, sort: true);
//        }
//        if (mounted)
//          setState(() {
//            notifyLoaded = true;
//          });
//      });
//    });
//  }
//
//  loadPosts() async {
//    final arrayContains = userModel.amFollowing;
//    arrayContains.add(userModel.getUserId());
//    arrayContains.addAll(userModel.myFollowers);
//
//    final lockSync = Lock();
//    await lockSync.synchronized(() async {
//      Firestore.instance
//          .collection(POST_BASE)
//          .where(PARTIES, arrayContainsAny: arrayContains)
//          .orderBy(CREATED_AT, descending: false)
//          .getDocuments()
//          .then((value) {
//        for (var doc in value.documents) {
//          BaseModel model = BaseModel(doc: doc);
//          if (model.myItem() && model.itChanged()) {
//            model
//              ..addMyDetails()
//              ..updateItems();
//          }
//          allPosts.addModel(model, sort: true);
//          if (mounted) setState(() {});
//          //translateToLocale(model);
//        }
//        postsLoaded = true;
//        allPosts.sort((p1, p2) => p2.time.compareTo(p1.time));
//        otherPosts =
//            allPosts.where((e) => e.userId != userModel.userId).toList();
//        myPosts = allPosts.where((e) => e.userId == userModel.userId).toList();
//        otherPosts.sort((p1, p2) => p2.time.compareTo(p1.time));
//        myPosts.sort((p1, p2) => p2.time.compareTo(p1.time));
//        userModel
//          ..put(POSTS_IDS, myPosts.map((e) => e.getObjectId()).toList())
//          ..updateItems();
//        if (mounted) setState(() {});
//      });
//    });
//  }
//
//  translateToLocale(BaseModel model) async {
//    final translator = new GoogleTranslator();
//    final input = model.getString(MESSAGE);
//    if (input.isEmpty) return;
//    if (model.myItem()) return;
//    translator.translate(input, to: appLocale.languageCode).then((s) {
//      print("input $input translated $s");
//      model.put(TRANSLATION, s);
//      bool theSame = input == s;
//      if (!theSame) otherPosts.addModel(model);
//      if (mounted) setState(() {});
//    });
//  }
//
//  uploadFailedStoryMedia(BaseModel model) async {
//    BaseModel photo = model.getModel(PHOTOS);
//    if (!model.myItem()) return;
//    if (!photo.isLocal) return;
//
//    File file = File(photo.urlPath);
//    bool hasFile = await file.exists();
//    if (!hasFile) return;
//    uploadFile(file, (res, err) {
//      if (null != err) return;
//      photo = createPhotoModel(
//          urlPath: res.fileUrl,
//          thumbnail: res.fileUrl,
//          isLocal: false,
//          objectId: res.documentId);
//    });
//    model
//      ..put(PHOTOS, photo)
//      ..updateItems();
////    myStories.addModel(model);
//    setState(() {});
//  }
//
//  loadMyFollowers() {
//    setState(() {
//      myFollowers.clear();
//    });
//    final ref = Firestore.instance.collection(USER_BASE);
//    for (String ids in userModel.myFollowers) {
//      ref.document(ids).get().then((value) {
//        BaseModel model = BaseModel(doc: value);
//        myFollowers.addModel(model);
//        setState(() {});
//      });
//    }
//  }
//
//  loadAmFollowing() {
//    setState(() {
//      amFollowing.clear();
//    });
//    final ref = Firestore.instance.collection(USER_BASE);
//    for (String ids in userModel.amFollowing) {
//      ref.document(ids).get().then((value) {
//        BaseModel model = BaseModel(doc: value);
//        amFollowing.addModel(model);
//        setState(() {});
//      });
//    }
//  }
//
////  loadStories() async {
////    final arrayContains = userModel.myFollowers;
////    arrayContains.add(userModel.getUserId());
////
////    final lockSync = Lock();
////    await lockSync.synchronized(() async {
////      Firestore.instance
////          .collection(STORY_BASE)
////          .where(PARTIES, arrayContainsAny: arrayContains)
////          .where(TIME,
////              isGreaterThan: (DateTime.now().millisecondsSinceEpoch -
////                  (Duration.millisecondsPerDay)))
////          .snapshots()
////          .listen((value) {
////        for (var doc in value.documents) {
////          BaseModel model = BaseModel(doc: doc);
////          if (mounted)
////            setState(() {
////              allStories.addModel(model);
////            });
////          //uploadFailedStoryMedia(model);
////        }
////        if (mounted)
////          setState(() {
////            myStories =
////                allStories.where((e) => e.userId == userModel.userId).toList();
////            otherStories =
////                allStories.where((e) => e.userId != userModel.userId).toList();
////
////            loadedMyStories = true;
////          });
////      });
////    });
////  }
//
////  pages() {
////    return Flexible(
////      child: PageView(
////        controller: vp,
////        physics: NeverScrollableScrollPhysics(),
////        onPageChanged: (p) {
////          if (null != videoController) videoController.pause();
////          setState(() {
////            currentPage = p;
////          });
////        },
////        children: <Widget>[
////          Home(),
////          Notifications(),
////          Following(),
////        ],
////      ),
////    );
////  }
//
//  btmTabs() {
//    return Container(
//      color: AppConfig.appColor,
//      padding: 10.padAtBottom(),
//      child: Row(
//          children: List.generate(5, (p) {
//        if (p == 4) {
//          return btmTabItems(
//            3,
//            icon: Feather.play,
//          );
//        }
//
//        if (p == 3) {
//          return btmTabItems(2, icon: "assets/images/ic_chat.png", asset: true);
//        }
//
//        if (p == 1) {
//          int count = myNotifications
//              .where((e) => !e.seenBy.contains(userModel.userId))
//              .toList()
//              .length;
//          return btmTabItems(1,
//              count: count, icon: "assets/images/ic_heart.png", asset: true);
//        }
//
//        if (p == 0) {
//          return btmTabItems(0,
//              icon: userModel.userImage.urlPath, isProfile: true, asset: true);
//        }
//
//        return btmTabItems(-1, icon: Feather.plus, isCenter: true);
//      })),
//    );
//  }
//
//  btmTabItems(
//    int page, {
//    //@required String title,
//    @required icon,
//    bool asset = false,
//    bool isProfile = false,
//    bool isCenter = false,
//    //bool showBadge = false,
//    int count = 0,
//  })
////  {
////    bool active = currentPage == page;
////
////    return Flexible(
////      child: GestureDetector(
////        onDoubleTap: () {
////          scrollTotallyUp(scrollControllers[page]);
////        },
////        onTap: () {
//////          if (page == -1) {
//////            pushAndResult(context, CreatePost(), result: (_) {
//////              if (null == _) return;
//////              setState(() {
//////                isPosting = true;
//////              });
//////              myPosts.addModel(_);
//////              postToServer(_);
//////            });
//////          return;
////          }
////
//////          if (page == 3) {
//////            return;
//////          }
////
////          if (page == 1) {
//////            Future.delayed(Duration(milliseconds: 15),(){
//////              final notSeen = myNotifications
//////                  .where((e) => !e.seenBy.contains(userModel.userId))
//////                  .toList();
//////              if (notSeen.length > 0) {
//////                for (var bm in notSeen) {
//////                  bm
//////                    ..putInList(SEEN_BY, userModel.userId, true)
//////                    ..updateItems();
//////                }
//////                setState(() {});
//////              }
//////    }
//////      );
////          }
////
////          setState(()
////    {
////            vp.jumpToPage(page);
////          });
////        },
//        child: Stack(
//          children: <Widget>[
//            Container(
//              width: context.screenWidthDivide(4),
//              height: 70,
//              color: Colors.transparent,
//              padding: 12.padAll(),
//              alignment: Alignment.center,
//              child: Stack(
//                alignment: Alignment.center,
//
//                //mainAxisSize: MainAxisSize.min,
//                //mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  //if (isCenter)
//                  Container(
//                    height: 60,
//                    width: 60,
//                    decoration: BoxDecoration(
//                        color: white.withOpacity(isCenter ? 1 : 0),
//                        border: Border.all(
//                            width: (active && !isCenter) ? 2 : 1,
//                            color: (active && !isCenter)
//                                ? black
//                                : white.withOpacity(
//                                    isCenter ? 0 : active ? 0 : .5)),
//                        shape: BoxShape.circle),
//                  ),
//                  if (asset) ...[
//                    if (isProfile)
//                      ClipRRect(
//                        borderRadius:
//                            BorderRadius.circular((active ? 40 : 42) / 2),
//                        child: CachedNetworkImage(
//                          imageUrl: icon,
//                          height: active ? 40 : 42,
//                          width: active ? 40 : 42,
//                          fit: BoxFit.cover,
//                          placeholder: (c, s) {
//                            return Container(
//                              height: active ? 25 : 22,
//                              width: active ? 25 : 22,
//                              alignment: Alignment.center,
//                              child: Icon(
//                                Feather.user,
//                                color: white.withOpacity(active ? 1.0 : 0.4),
//                              ),
//                            );
//                          },
//                        ),
//                      )
//                    else
//                      Image.asset(
//                        icon,
//                        height: active ? 25 : 22,
//                        width: active ? 25 : 22,
//                        color: isCenter
//                            ? AppConfig.appColor
//                            : white.withOpacity(active ? 1.0 : 0.4),
//                      )
//                  ] else
//                    Icon(
//                      icon,
//                      size: active ? 25 : 22,
//                      color: isCenter
//                          ? AppConfig.appColor
//                          : white.withOpacity(active ? 1.0 : 0.7),
//                    ),
//                ],
//              ),
//            ),
//            if (count > 0)
//              Container(
//                height: 25,
//                width: 25,
//                padding: 4.padAll(),
//                margin: 7.padAll(),
//                alignment: Alignment.center,
//                child: Text(
//                  "${count > 9 ? "$count+" : count}",
//                  style: textStyle(true, 10, white),
//                ),
//                decoration: BoxDecoration(
//                    border: Border.all(color: white),
//                    color: Colors.red,
//                    shape: BoxShape.circle),
//              )
//          ],
//        ),
//      ),
//    );
//  }
//
//  topTabs() {
//    return Container(
//      color: AppConfig.appColor,
//      padding: 30.padAtTop(),
//      child: Builder(builder: (ctx) {
//        if (currentPage == 0) {
//          return Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Flexible(
//                child: Row(
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    topTabItems(
//                        icon: AntDesign.menu_fold,
//                        onTap: () {
////                          _toggle();
//                        }),
//                    topTabItems(
//                        icon: "assets/images/ic_message.png",
//                        asset: true,
//                        assetSize: 60,
//                        count: showNewMessageDot.length,
//                        onTap: () {
////                          pushAndResult(context, Messages());
//                        }),
//                  ],
//                ),
//              ),
//              Flexible(
//                child: Row(
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    topTabItems(
//                        icon: "assets/images/ic_search.png",
//                        asset: true,
//                        assetSize: 50,
//                        onTap: () {
////                          pushAndResult(context, Search());
//                        }),
//                    topTabItems(
//                        icon: "assets/images/ic_notes.png",
//                        asset: true,
//                        onTap: () {
////                          pushAndResult(context, MyNotes());
//                        }),
//                  ],
//                ),
//              ),
//            ],
//          );
//        }
//
//        String key = currentPage == 1 ? LangKey.notifications : LangKey.posts;
//
//        return Container(
//          alignment: Alignment.center,
//          height: 50,
//          padding: 15.padAll(),
//          child: Text(
//            translate(context, key),
//            style: textStyle(true, 18, white),
//          ),
//        );
//      }),
//    );
//  }
//
//  topTabItems(
//      {
//      //@required String title,
//      @required icon,
//      bool asset = false,
//      int count = 0,
//      double assetSize = 30,
//      onTap}) {
//    return Flexible(
//      child: GestureDetector(
//        onTap: () {
//          if (null == onTap) return;
//          onTap();
//        },
//        onLongPress: () {
////          pushAndResult(context, InCallManager());
//        },
//        child: Stack(
//          children: <Widget>[
//            Container(
//              width: 60,
//              height: 70,
//              color: Colors.transparent,
//              padding: 12.padAll(),
//              alignment: Alignment.center,
//              child: Stack(
//                alignment: Alignment.center,
//
//                //mainAxisSize: MainAxisSize.min,
//                //mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  if (asset)
//                    Image.asset(
//                      icon,
//                      height: assetSize,
//                      width: assetSize,
//                      color: white,
//                      fit: BoxFit.cover,
//                    )
//                  else
//                    Icon(
//                      icon,
//                      size: 25,
//                      color: white,
//                    ),
//                ],
//              ),
//            ),
//            if (count > 0)
//              Container(
//                height: 25,
//                width: 25,
//                padding: 4.padAll(),
//                margin: 7.padAll(),
//                alignment: Alignment.center,
//                child: Text(
//                  "${count > 9 ? "$count+" : count}",
//                  style: textStyle(true, 10, white),
//                ),
//                decoration: BoxDecoration(
//                    border: Border.all(color: white),
//                    color: Colors.red,
//                    shape: BoxShape.circle),
//              )
//          ],
//        ),
//      ),
//    );
//  }
//
//  photoView() {
////    bool noStories = myStories.isEmpty;
//
//    return Container(
//      height: 130,
//      margin: 35.padAt(t: 0, b: 5),
//      alignment: Alignment.center,
//      child: GestureDetector(
//        onTap: () {},
//        child: Container(
//          height: 120,
//          width: 120,
//          child: Stack(
//            alignment: Alignment.bottomRight,
//            children: <Widget>[
////              DashedCircle(
////                strokeWidth: 5,
////                color: black,
////                dashes: myStories.length,
////                gapSize: 5,
////                child: Container(
////                  padding: 5.padAll(),
////                  child: imageHolder(
////                      120,
////                      userModel.userImage.urlPath
////                      /* noStories
////                          ? userModel.userImage.urlPath
////                          : (myStories[0].photo.isVideo
////                              ? myStories[0].photo.thumbnailPath
////                              : myStories[0].photo.urlPath)*/
////                      ,
////                      strokeColor: black.withOpacity(noStories ? 0.2 : 1),
////                      iconHolderSize: 40,
////                      stroke: 1, onImageTap: () async {
////                    pushAndResult(context, MyCamera(),
////                        result: (List<BaseModel> _) {
////                      if (null != _) ;
////                      setState(() {
////                        isPostingStory = true;
////                      });
////                      //allStories.addModel(_);
////                      postStoriesToServer(_);
////                    });
////                  }),
////                ),
////              ),
////              if (isPostingStory)
////                Align(
////                  alignment: Alignment.center,
////                  child: SizedBox(
////                    height: 125,
////                    width: 125,
////                    child: CircularProgressIndicator(
////                      valueColor: AlwaysStoppedAnimation(white),
////                      strokeWidth: 2,
////                    ),
////                  ),
////                ),
//              Container(
//                height: 35,
//                width: 35,
//                padding: 6.padAll(),
//                margin: 6.padAll(),
//                child: Image.asset(
//                  "assets/images/camera.png",
//                  color: white,
//                ),
//                decoration: BoxDecoration(
//                    color: black.withOpacity(.8),
//                    border: Border.all(color: white, width: 1),
//                    shape: BoxShape.circle),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//  menuItemView({String title, String subTitle, onTap, bool colorIt = false}) {
//    return FlatButton(
//      onPressed: onTap,
//      padding: 5.padAll(),
//      child: Container(
//          alignment: Alignment.centerRight,
//          padding: (null == subTitle ? 8 : 6).padAll(),
//          //height: 80,
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              Text(title,
//                  style:
//                      textStyle(true, 14, /*colorIt ? Colors.blue : */ white)),
//              if (null != subTitle) ...[
//                2.spaceHeight(),
//                Text(
//                  subTitle,
//                  style: textStyle(false, 11,
//                      (/*colorIt ? Colors.blue :*/ white).withOpacity(.7)),
//                ),
//              ]
//            ],
//          )),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return InnerDrawer(
//        key: drawerKey,
//        onTapClose: true,
//        swipe: true,
//        //colorTransition: Color.red, // default Color.black54
//        innerDrawerCallback: (a) {
//          print(a);
//          setState(() {
//            drawerOpened = a;
//          });
//        },
//        leftOffset: 0.1,
//        rightOffset: 0.6,
//        leftScale: 0.8,
//        rightScale: 0.9,
//        proportionalChildArea: true,
//        borderRadius: 25,
//        scale: IDOffset.horizontal(.7),
//        leftAnimationType: InnerDrawerAnimation.static,
//        rightAnimationType: InnerDrawerAnimation.quadratic,
////        backgroundColor: AppConfig.appColor,
//        onDragUpdate: (double val, InnerDrawerDirection direction) {
//          //print(direction);
//        },
////        leftChild: menuDrawer(),
//        scaffold: Scaffold(
//          key: scaffoldKey,
//          backgroundColor: white,
////          body: homeBody(),
//        ));
//  }
////
////  menuDrawer() {
////    return Material(
////      color: Colors.transparent,
////      child: Container(
////        color: AppConfig.appColor,
////        child: Column(
////          children: <Widget>[
////            Flexible(
////              child: Column(
////                children: <Widget>[
////                  30.spaceHeight(),
////                  Container(
////                      alignment: Alignment.centerRight,
////                      padding: 10.padAll(),
////                      child: Column(
////                        crossAxisAlignment: CrossAxisAlignment.start,
////                        mainAxisSize: MainAxisSize.min,
////                        children: <Widget>[
////                          Text(
////                              translate(
////                                  context,
////                                  timeOfDayText
////                                      .toString()
////                                      .replaceAll("TimeOfTheDay.", "")),
////                              style: textStyle(true, 16, white)),
////                          5.spaceHeight(),
////                          Text(translate(context, LangKey.been_here_since),
////                              style: textStyle(false, 12, white)),
////                          5.spaceHeight(),
////                          Text("9-10-2019", style: textStyle(false, 12, white)),
////                        ],
////                      )),
////                  photoView(),
////                  menuItemView(
////                      title: userModel.fullName,
////                      subTitle: "@${userModel.nickName}",
////                      onTap: () {
////                        print("ok");
////                      }),
////                  Flexible(
////                    child: ListView(
////                      shrinkWrap: true,
////                      padding: 0.padAll(),
////                      children: List.generate(7, (p) {
////                        return menuItemView(
////                            title: translate(context, 'drawer_$p'),
////                            onTap: () {
////                              print("ok");
////
//////                              if (p == 0)
//////                                pushAndResult(context, ProfileSettings(),
//////                                    result: (_) {
//////                                  if (null == _ || !_) return;
//////                                  updateMyProfile();
//////                                });
//////                              if (p == 1)
//////                                pushAndResult(context, AddSuggestions());
//////                              if (p == 2)
//////                                pushAndResult(context, Settings(), result: (_) {
//////                                  setState(() {});
//////                                });
//////                              if (p == 3) pushAndResult(context, AboutUs());
//////                              if (p == 4)
//////                                pushAndResult(context, ShowPartners());
//////                              if (p == 5)
//////                                pushAndResult(context, PrivacyPolicy());
//////                              if (p == 6)
//////                                pushAndResult(context, TermsAndConditions());
//////                            });
////                      }),
////                    ),
////                  ),
////                ],
////              ),
////            ),
////            menuItemView(
////                colorIt: true,
////                title: translate(context, LangKey.sign_out),
////                subTitle: "Version 1.0",
////                onTap: () {
////                  showMessage(
////                      context,
////                      Icons.warning,
////                      Colors.red,
////                      translate(context, LangKey.logout),
////                      translate(context, LangKey.logout_string),
////                      clickYesText: AppTranslations.of(context)
////                          .text(LangKey.logout_string_yes),
////                      cancellable: true, onClicked: (_) async {
////                    showProgress(true, progressId, context,
////                        cancellable: true,
////                        msg: AppTranslations.of(context)
////                            .text(LangKey.logging_out));
////                    createBasicListeners(
////                        suspend: true,
////                        redirectBack: () {
////                          popUpWidgetScreenUntil(context, Welcome());
////                        });
////                  });
////                }),
////            20.spaceHeight(),
////          ],
////        ),
////      ),
////    );
////  }
////
////  postingIndicator() {
////    if (!isPosting) return Container();
////    return Container(
////      height: 3,
////      margin: 2.padAtTop(),
////      child: LinearProgressIndicator(
////        backgroundColor: black.withOpacity(.02),
////        valueColor: AlwaysStoppedAnimation(Colors.green),
////      ),
////    );
////  }
////
////  homeBody() {
////    return Container(
////      //padding: 40.padAtTop(),
////      child: Column(
////        children: <Widget>[topTabs(), postingIndicator(), pages(), btmTabs()],
////      ),
////    );
////  }
////
////  void updateMyProfile() async {
////    BaseModel photo = userModel.userImage;
////    if (photo.isLocal && photo.urlPath.isNotEmpty) {
////      setState(() {
////        isPosting = true;
////      });
////
////      File f = File(photo.urlPath);
////      uploadFile(f, (upload, err) async {
////        if (null != err) {
////          showProgress(false, progressId, context);
////          showMessage(context, Icons.error, red0, "Upload Error", err,
////              delayInMilli: 900, cancellable: true);
////          return;
////        }
////        userModel
////          ..put(
////              USER_IMAGE,
////              createPhotoModel(
////                      objectId: upload.documentId,
////                      urlPath: upload.fileUrl,
////                      thumbnail: "",
////                      isLocal: false)
////                  .items)
////          ..updateItems();
////        setState(() {
////          isPosting = false;
////        });
////      });
////      return;
////    }
////  }
////
////  void postStoriesToServer(List<BaseModel> stories) async {
////    final arrayContains = userModel.myFollowers;
////    arrayContains.add(userModel.getUserId());
////
////    if (null == stories) return;
////    for (var story in stories) {
////      BaseModel photo = story.photo;
////      File file = File(photo.urlPath);
////      bool isVideo = photo.isVideo;
////      String id = story.getObjectId();
////
////      uploadFile(file, (res, err) {
////        if (null != err) return;
////        photo = photo..put(URL_PATH, res.fileUrl)..put(IS_LOCAL, !isVideo);
////
////        if (isVideo) {
////          File thumbFile = File(photo.thumbnailPath);
////          uploadFile(thumbFile, (res, err) {
////            if (null != err) return;
////            photo = photo
////              ..put(THUMBNAIL_PATH, res.fileUrl)
////              ..put(IS_LOCAL, false);
////            story
////              ..put(PHOTOS, photo.items)
////              ..put(PARTIES, arrayContains)
////              ..saveItem(STORY_BASE, true, document: id, onComplete: () {
////                allStories.addModel(story);
////                myStories = allStories
////                    .where((e) => e.userId == userModel.userId)
////                    .toList();
////                otherStories = allStories
////                    .where((e) => e.userId != userModel.userId)
////                    .toList();
////                isPostingStory = false;
////                if (mounted) setState(() {});
////                sendPushNotification(
////                    title: userModel.nickName,
////                    type: NOTIFY_TYPE_STORY,
////                    message: "${userModel.nickName} shared a story",
////                    notifiedId: story.userId,
////                    parties: arrayContains,
////                    notifiedOnThis: story);
////              });
////          });
////        }
////
////        story..put(PHOTOS, photo.items)..put(PARTIES, arrayContains);
////        story.saveItem(STORY_BASE, true, document: id, onComplete: () {
////          allStories.addModel(story);
////          myStories =
////              allStories.where((e) => e.userId == userModel.userId).toList();
////          otherStories =
////              allStories.where((e) => e.userId != userModel.userId).toList();
////          isPostingStory = false;
////          if (mounted) setState(() {});
////        });
////      });
////    }
////    if (mounted) setState(() {});
////  }
////
////  void postToServer(BaseModel model, {bool retrying = false}) async {
////    if (retrying && !model.myItem()) return;
////    final photos = model.getPhotos.where((element) => element.isLocal).toList();
////    if (retrying && photos.isEmpty) return;
////
////    uploadingPost.add(model.getObjectId());
////    final arrayContains = userModel.myFollowers;
////    arrayContains.add(userModel.getUserId());
////    model.put(PARTIES, arrayContains);
////    updatePostIdsCount(model);
////    myPosts.addModel(model);
////    model.saveItem(POST_BASE, true, document: model.getObjectId(),
////        onComplete: () {
////      setState(() {});
////    });
////
////    //List<BaseModel> photos = model.getPhotos;
////    bool hasMedia = photos.isNotEmpty;
////
////    if (hasMedia) {
////      uploadMediaFiles(photos, onError: (err) {
////        showMessage(context, Icons.error, red0, "Upload Error", err,
////            delayInMilli: 900, cancellable: true);
////        return;
////      }, onUploaded: (uploaded) {
////        model..put(PHOTOS, uploaded.map((e) => e.items).toList());
////        model.saveItem(POST_BASE, true, document: model.getObjectId(),
////            onComplete: () {
////          sendPushNotification(
////              title: userModel.nickName,
////              type: NOTIFY_TYPE_POST,
////              message: "${userModel.nickName} shared a post",
////              notifiedId: model.getObjectId(),
////              parties: arrayContains,
////              notifiedOnThis: model);
////          uploadingPost.clear();
////          //just incase there is a video....
////          clearFrames();
////          myPosts.addModel(model);
////          //.addModel(model);
////          setState(() {
////            isPosting = false;
////          });
////        });
////      });
////    }
////  }
////
////  updatePostIdsCount(BaseModel model, {bool remove = false}) {
////    userModel
////      ..putInList(POSTS_IDS, model.getObjectId(), true)
////      ..updateItems();
////    setState(() {});
////  }
////
////  clearFrames() async {
////    //for all the thumbnails frames generated
////    for (var file in trimmedThumbFrames) {
////      bool exists = await file.exists();
////      if (!exists) continue;
////      await file.delete();
////    }
////
////    //for all the videos frames generated
////    for (var file in trimmedVideoFrames) {
////      bool exists = await file.exists();
////      if (!exists) continue;
////      await file.delete();
////    }
////
////    trimmedVideoFrames.clear();
////    trimmedThumbFrames.clear();
////    if (mounted) setState(() {});
////  }
////
////  List loadedIds = [];
////  loadMessages() async {
////    var lock = Lock();
////    await lock.synchronized(() async {
//////      List<Map> myChats = List.from(userModel.getList(MY_CHATS));
////      var sub = Firestore.instance
////          .collection(AppDataBase.chat_ids_base)
////          .where(PARTIES, arrayContains: userModel.getObjectId())
////          .snapshots()
////          .listen((shots) {
////        for (DocumentSnapshot doc in shots.documents) {
////          BaseModel chatIdModel = BaseModel(doc: doc);
////          String chatId = chatIdModel.getObjectId();
////          if (userModel.getList(DELETED_CHATS).contains(chatId)) continue;
////          if (loadedIds.contains(chatId)) {
////            continue;
////          }
////          loadedIds.add(chatId);
////
////          var sub = Firestore.instance
////              .collection(CHAT_BASE)
////              .where(PARTIES, arrayContains: userModel.getUserId())
////              .where(CHAT_ID, isEqualTo: chatId)
////              .orderBy(TIME, descending: true)
////              .limit(1)
////              .snapshots()
////              .listen((shots) async {
////            if (shots.documents.isNotEmpty) {
////              BaseModel cModel = BaseModel(doc: (shots.documents[0]));
////              /*if(isBlocked(null,userId: getOtherPersonId(cModel))){
////                lastMessages.removeWhere((bm)=>bm.getString(CHAT_ID)==cModel.getString(CHAT_ID));
////                chatMessageController.add(true);
////                return;
////              }*/
////            }
////            if (stopListening.contains(chatId)) return;
////            for (DocumentSnapshot doc in shots.documents) {
////              BaseModel model = BaseModel(doc: doc);
////              String chatId = model.getString(CHAT_ID);
////              int index = lastMessages.indexWhere(
////                  (bm) => bm.getString(CHAT_ID) == model.getString(CHAT_ID));
////              if (index == -1) {
////                lastMessages.add(model);
////              } else {
////                lastMessages[index] = model;
////              }
////
////              if (!model.getList(READ_BY).contains(userModel.getObjectId()) &&
////                  !model.myItem() &&
////                  visibleChatId != model.getString(CHAT_ID)) {
////                try {
////                  if (!showNewMessageDot.contains(chatId))
////                    showNewMessageDot.add(chatId);
////                  setState(() {});
////                } catch (E) {
////                  if (!showNewMessageDot.contains(chatId))
////                    showNewMessageDot.add(chatId);
////                  setState(() {});
////                }
////                countUnread(chatId);
////              }
////            }
////
////            String otherPersonId =
////                getOtherPersonId(chatIdModel.getList(PARTIES));
////            loadOtherPerson(otherPersonId);
////
////            try {
////              lastMessages
////                  .sort((bm1, bm2) => bm2.getTime().compareTo(bm1.getTime()));
////            } catch (E) {}
////          });
////
////          subs.add(sub);
////        }
////        chatSetup = true;
////        if (mounted) setState(() {});
////      });
////      subs.add(sub);
////    });
////  }
////
////  loadOtherPerson(String uId, {int delay = 0}) async {
////    var lock = Lock();
////    await lock.synchronized(() async {
////      Future.delayed(Duration(seconds: delay), () async {
////        DocumentSnapshot doc =
////            await Firestore.instance.collection(USER_BASE).document(uId).get();
////
////        if (doc == null) return;
////        if (!doc.exists) return;
////
////        BaseModel user = BaseModel(doc: doc);
////        otherPeronInfo[uId] = user;
////        if (mounted) setState(() {});
////      });
////    }, timeout: Duration(seconds: 10));
////  }
////
////  countUnread(String chatId) async {
////    var lock = Lock();
////    lock.synchronized(() async {
////      int count = 0;
////      QuerySnapshot shots = await Firestore.instance
////          .collection(CHAT_BASE)
////          .where(CHAT_ID, isEqualTo: chatId)
////          .getDocuments();
////
////      for (DocumentSnapshot doc in shots.documents) {
////        BaseModel model = BaseModel(doc: doc);
////        if (!model.getList(READ_BY).contains(userModel.getObjectId()) &&
////            !model.myItem()) {
////          count++;
////        }
////      }
////      unreadCounter[chatId] = count;
////      chatMessageController.add(true);
////    });
////  }
//}
