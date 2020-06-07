import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chatsapp/app/app.dart';
import 'package:chatsapp/app_config.dart';

//import 'feed/video_pop.dart';
//import 'show_post.dart';

class ShowProfile extends StatefulWidget {
  final BaseModel thisUser;

  const ShowProfile({Key key, @required this.thisUser}) : super(key: key);
  @override
  _ShowProfileState createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  BaseModel thisUser;
  List<BaseModel> sortedPost = [];
  bool postsLoaded = false;
  @override
  initState() {
    super.initState();

    setState(() {
      thisUser = widget.thisUser;
      sortedPost = otherPosts
          .where((e) => e.getUserId() == thisUser.getUserId())
          .toList();
      sortedPost.sort((p1, p2) => p2.time.compareTo(p1.time));

      postsLoaded = sortedPost.isNotEmpty;
    });
    //loadUser();
    loadPosts();
  }

  loadUser() async {
    Firestore.instance
        .collection(USER_BASE)
        .document(widget.thisUser.getUserId())
        .get()
        .then((value) {
      thisUser = BaseModel(doc: value);
      if (mounted) setState(() {});
    });
  }

  loadPosts() async {
    Firestore.instance
        .collection(POST_BASE)
        .where(USER_ID, isEqualTo: widget.thisUser.chatNotifications)
        .getDocuments()
        .then((value) {
      for (var doc in value.documents) {
        BaseModel model = BaseModel(doc: doc);
        if (mounted)
          setState(() {
            sortedPost.addModel(model, sort: true);
          });
      }
      thisUser
        ..put(POSTS_IDS, sortedPost.map((e) => e.getObjectId()).toList())
        ..updateItems();
      postsLoaded = true;
      if (mounted) setState(() {});
    });
  }

  profileBar() {
//    bool following = userModel.amFollowing.contains(thisUser.getUserId());

    return Container(
      color: white,
      padding: 10.padAll(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
//              imageHolder(
//                100,
//                thisUser.userImage.urlPath,
//                strokeColor: black,
//                stroke: 3,
//                iconHolderSize: 30,
//              ),

              Flexible(
                  child: Column(
                children: <Widget>[
                  Container(
                    padding: 10.padAll(),
                    decoration: BoxDecoration(
                        color: AppConfig.appColor.withOpacity(.03),
                        border: Border.all(color: black.withOpacity(.02)),
                        borderRadius: BorderRadius.circular(10)),
//                    child:
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: List.generate(3, (i) {
//                        String title;
//                        String value;
//
//                        if (i == 0) {
//                          title = thisUser.postIds.length.toString();
//                          value = "cheers";
//                        }
//
//                        if (i == 1) {
//                          title = thisUser
//                              .getList(MY_FOLLOWER_IDS)
//                              .length
//                              .toString();
//                          value = "followers";
//                        }
//
//                        if (i == 2) {
//                          title = thisUser
//                              .getList(AM_FOLLOWING_IDS)
//                              .length
//                              .toString();
//                          value = "following";
//                        }
//
//                        return Flexible(
//                          child: GestureDetector(
//                            onTap: () {},
//                            child: Container(
//                              width: context.screenWidthDivide(3),
//                              color: Colors.transparent,
//                              alignment: Alignment.center,
//                              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                mainAxisSize: MainAxisSize.min,
//                                children: <Widget>[
//                                  Text(
//                                    title,
////                                    style: textStyle(true, 18, black),
//                                  ),
//                                  5.spaceHeight(),
//                                  Text(
//                                    value,
////                                    style: textStyle(
////                                        true, 12, black.withOpacity(.6)),
//                                  )
//                                ],
//                              ),
//                            ),
//                          ),
//                        );
//                      }),
//                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: FlatButton(
                          onPressed: () {
                            print("Clicked...");
//                            clickChat(context, thisUser);
                          },
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(color: AppConfig.appColor)),
                          child: Center(
                              child: Text(
                            "Message",
//                            style: textStyle(true, 14, AppConfig.appColor),
                          )),
                        ),
                      ),
                      5.spaceWidth(),
                      Flexible(
                        child: FlatButton(
                          onPressed: () {},
//                            followThisUser(thisUser, following, onComplete: () {
//                              setState(() {});
                          child: Text("hello world!"),
                        ),

//                          color: AppConfig.appColor,
//                          shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.circular(5),
//                              side: BorderSide(color: AppConfig.appColor)),
//                          child: Center(
//                              child: Text(
//                            following ? "Unfollow" : "Follow",
//                            style: textStyle(true, 12, white),
//                          )),
                      ),
                    ],
                  )
                ],
              ))
            ],
          ),
          10.spaceHeight(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                thisUser.fullName,
//                  style: textStyle(true, 16, AppConfig.appText)
              ),
//              5.spaceHeight(),
              Text(
                '@${thisUser.nickName}',
//                style: textStyle(false, 13, AppConfig.appText.withOpacity(.7)),
              ),
              5.spaceHeight(),
              Text(
                thisUser.profession,
//                style: textStyle(false, 13, AppConfig.appText.withOpacity(.7)),
              ),
              5.spaceHeight(),
              Container(
                padding: 10.padAll(),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: AppConfig.appColor.withOpacity(.03),
                    border: Border.all(color: black.withOpacity(.02)),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "about me".toUpperCase(),
//                      style: textStyle(
//                          true, 12, AppConfig.appText.withOpacity(.7)),
                    ),
                    if (thisUser.aboutMe.isNotEmpty) ...[
                      5.spaceHeight(),
                      Text(
                        thisUser.aboutMe,
//                        style: textStyle(false, 15, black),
                      ),
                    ]
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  myPostsGrid() {
    if (!postsLoaded)
      return Container(
        height: 70,
        alignment: Alignment.center,
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation(AppConfig.appColor),
          ),
        ),
      );

    if (sortedPost.isEmpty)
      return Container(
        color: white,
        alignment: Alignment.center,
        height: context.screenHeight() / 2,
        child: Container(),
//        emptyLayout(Icons.add_circle_outline, "No Photos and Videos",
//            "${thisUser.fullName} hasn't shared any content yet.",
//            isIcon: true),
      );

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
      itemBuilder: (ctx, p) {
        BaseModel thisPost = sortedPost[p];
        final videos = thisPost.getPhotos.where((e) => e.isVideo).toList();

        return GestureDetector(
          onLongPress: () {
            final videos = thisPost.getPhotos.where((e) => e.isVideo).toList();
            if (videos.isEmpty) return;
//            pushAndResult(
//                context,
////                VideoPop(
////                  thisPost: thisPost,
////                  play: true,
////                )
//                );
          },
          onTap: () {
//            pushAndResult(
//                context,
//                ShowPost(
//                  thisPost: thisPost,
//                  scrollToThis: p,
//                ));
          },
          child: Stack(
            children: <Widget>[
              Builder(
                builder: (ctx) {
                  List<BaseModel> photos = thisPost.getPhotos;
                  if (photos.isNotEmpty) {
                    BaseModel photo = photos[0];

                    return Container();
//                      CachedNetworkImage(
//                      imageUrl:
//                          photo.isVideo ? photo.thumbnailPath : photo.urlPath,
//                      fit: BoxFit.cover,
//                      width: double.infinity,
//                      height: double.infinity,
//                      placeholder: (s, c) {
//                        return placeHolder(double.infinity);
//                      },
//                    );
                  }

                  return Container(
                      //margin: 8.padAll(),
                      width: double.infinity,
                      height: double.infinity,
                      color: AppConfig.appColor,
                      padding: 2.padAll(),
                      child: Flexible(
                        child: Text(
                          thisPost.message,
                          //maxLines: 4,
                          //overflow: TextOverflow.ellipsis,
//                          style: textStyle(false, 6, white),
                        ),
                      ));
                },
              ),
              if (videos.isNotEmpty)
                Container(
                  height: 30,
                  width: 30,
                  padding: 7.padAll(),
                  margin: 6.padAll(),
                  decoration: BoxDecoration(
                      color: black.withOpacity(.8),
                      borderRadius: BorderRadius.circular(4)),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.play_arrow,
                    color: white,
                    size: 15,
                  ),
                )
              else
                Container(
                  height: 30,
                  width: 30,
                  padding: 7.padAll(),
                  margin: 6.padAll(),
                  decoration: BoxDecoration(
                      color: black.withOpacity(.8),
                      borderRadius: BorderRadius.circular(4)),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.image,
                    color: white,
                    size: 15,
                  ),
                )
            ],
          ),
        );
      },
      itemCount: sortedPost.length,
      padding: 5.padAll(),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: white,
      appBar: AppBar(
        title: Text(widget.thisUser.fullName),
      ),
      body: Stack(
        children: <Widget>[
//          Image.asset(
//            'assets/images/profile_bg.png',
//            fit: BoxFit.fitWidth,
//            height: context.screenHeight(),
//            width: context.screenWidth(),
//          ),

          ListView(
            padding: 5.padAtTop(),
            children: <Widget>[profileBar(), myPostsGrid()],
          ),
        ],
      ),
    );
  }
}
