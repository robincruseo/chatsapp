part of 'app.dart';

class BaseModel {
  Map<String, Object> items = new Map();
  Map<String, Object> itemUpdate = new Map();
  Map<String, Map> itemUpdateList = new Map();
  Map<String, Map> itemUpdateMap = new Map();

  BaseModel({Map items, DocumentSnapshot doc}) {
    if (items != null) {
      Map<String, Object> theItems = Map.from(items);
      this.items = theItems;
    }
    if (doc != null && doc.exists) {
      this.items = doc.data;
      this.items[OBJECT_ID] = doc.documentID;
    }
  }

  void put(String key, Object value) {
    items[key] = value;
    itemUpdate[key] = value;
  }

  void putInList(String key, Object value, bool add) {
    List itemsInList = items[key] == null ? List() : List.from(items[key]);
    if (add) {
      if (!itemsInList.contains(value)) itemsInList.add(value);
    } else {
      itemsInList.removeWhere((E) => E == value);
    }
    items[key] = itemsInList;

    Map update = Map();
    update[ADD] = add;
    update[VALUE] = value;

    itemUpdateList[key] = update;
  }

  void putInMap(String mapKey, String itemKey, Object itemValue, bool add) {
    Map itemsInList = items[mapKey] == null ? Map() : Map.from(items[mapKey]);
    if (add) {
      itemsInList[itemKey] = itemValue;
    } else {
      itemsInList.remove(itemKey);
    }
    items[mapKey] = itemsInList;

    Map update = Map();
    update[ADD] = add;
    update[KEY] = itemKey;
    update[VALUE] = itemValue;

    itemUpdateMap[mapKey] = update;
  }

  void remove(String key) {
    items.remove(key);
    itemUpdate[key] = null;
  }

  String getObjectId() {
    Object value = items[OBJECT_ID];
    return value == null || !(value is String) ? "" : value.toString();
  }

  List getList(String key) {
    Object value = items[key];
    return value == null || !(value is List) ? new List() : List.from(value);
  }

  List<Object> addToList(String key, Object value, bool add) {
    List<Object> list = items[key];
    list = list == null ? new List<Object>() : list;
    if (add) {
      if (!list.contains(value)) list.add(value);
    } else {
      list.remove(value);
    }
    put(key, list);
    return list;
  }

  BaseModel getModel(String key) {
    return BaseModel(items: getMap(key));
  }

  List get postIds => getList(POSTS_IDS);
  List get myFollowers => getList(MY_FOLLOWER_IDS);
  List get amFollowing => getList(AM_FOLLOWING_IDS);
  List get hidden => getList(HIDDEN);
  List get parties => getList(PARTIES);
  List get likedBy => getList(LIKED_BY);
  List get commentedBy => getList(COMMENTED_BY);
  List get readBy => getList(READ_BY);
  List get seenBy => getList(SEEN_BY);
  List get mutedItems => getList(MUTED);
  List get blockedIds => getList(BLOCKED_IDS);
  List<BaseModel> get getPhotos => getListModel(PHOTOS);
  List<BaseModel> get getComments => getListModel(LAST_COMMENTS);
  List<BaseModel> get interests => getListModel(INTERESTS);

  bool get videoAutoMute => getBoolean(VIDEO_AUTO_MUTE);
  bool get videoAutoPlay => getBoolean(VIDEO_AUTO_PLAY);
  bool get deleted => getBoolean(DELETED);
  bool get isLocal => getBoolean(IS_LOCAL);
  bool get pushNotifications => getBoolean(PUSH_NOTIFICATIONS);
  bool get smsNotifications => getBoolean(SMS_NOTIFICATIONS);
  bool get chatNotifications => getBoolean(CHAT_NOTIFICATIONS);
  bool get emailNotifications => getBoolean(EMAIL_NOTIFICATIONS);
  bool get isVideo => getBoolean(IS_VIDEO);
  bool get showTranslated => getBoolean(SHOW_TRANSLATED);
  bool get isMaugost => getEmail() == ("ammaugost@gmail.com");
  bool get isAdmin => getBoolean(IS_ADMIN);
  bool get amInterested => getBoolean(AM_INTERESTED);

  BaseModel get notifiedOn => getModel(NOTIFIED_ON);
  BaseModel get photo => getModel(PHOTOS);
  BaseModel get userImage => getModel(USER_IMAGE);

  String get profileImage => getString(USER_IMAGE);
  String get notifiedId => getString(NOTIFIED_ID);
  String get pushToken => getString(PUSH_TOKEN);
  String get value => getString(VALUE);
  String get gender => getString(GENDER);
  String get dateOfBirth => getString(DATE_OF_BIRTH);
  String get country => getString(COUNTRY);
  String get caption => getString(CAPTION);
  String get videoLength => getString(VIDEO_LENGTH);
  String get urlPath => getString(URL_PATH);
  String get thumbnailPath => getString(THUMBNAIL_PATH);
  String get aboutMe => getString(ABOUT_ME);
  String get profession => getString(PROFESSION);
  String get message => getString(MESSAGE);
  String get chatId => getString(CHAT_ID);

  int get createdAt => getInt(CREATED_AT);
  int get time => getInt(TIME);
  int get type => getInt(TYPE);

  double get myBalance => getDouble(MY_BALANCE);

  List<BaseModel> getListModel(String key) {
    return getList(key).map((e) => BaseModel(items: e)).toList();
  }

  Map getMap(String key) {
    Object value = items[key];
    return value == null || !(value is Map)
        ? new Map<String, String>()
        : Map.from(value);
  }

  Object get(String key) {
    return items[key];
  }

  String getUserId() {
    Object value = items[USER_ID];

    return value == null || !(value is String) ? "" : value.toString();
  }

  String get userId => getString(USER_ID);
  String get nickName => getString(NICKNAME);
  String get fullName => getString(FULL_NAME);
  String get refCode => getString(REF_CODE);

  String getUId() {
    Object value = items[USER_ID];
    return value == null || !(value is String) ? "" : value.toString();
  }

  String getString(String key) {
    Object value = items[key];
    return value == null || !(value is String) ? "" : value.toString();
  }

  String getEmail() {
    Object value = items[EMAIL];
    return value == null || !(value is String) ? "" : value.toString();
  }

  String getPassword() {
    Object value = items[PASSWORD];
    return value == null || !(value is String) ? "" : value.toString();
  }

  bool isMuted(String chatId) {
    List<String> readBy = getList(MUTED);
    return readBy.contains(chatId);
  }

  bool isMale() {
    return getInt(GENDER) == 0;
  }

  bool myItem() {
    return getUserId() == (userModel.getUserId());
  }

  bool itChanged() {
    return (items[FULL_NAME] != (userModel.fullName)) ||
        (items[USER_IMAGE] != (userModel.userImage)) ||
        (items[PUSH_TOKEN] != (userModel.pushToken)) ||
        (items[USER_IMAGE] != (userModel.userImage));
  }

  bool mySentChat() {
    return getBoolean(MY_SENT_CHAT);
  }

  bool isHidden() {
    List<String> readBy = getList(HIDDEN);
    return readBy.contains(userModel.getObjectId());
  }

  int getInt(String key) {
    Object value = items[key];
    return value == null || !(value is int) ? 0 : (value);
  }

  int getType() {
    Object value = items[TYPE];
    return value == null || !(value is int) ? 0 : value;
  }

  double getDouble(String key) {
    Object value = items[key];
    return value == null || !(value is double) ? 0 : value;
  }

  int getTime() {
    Object value = items[TIME];
    return value == null || !(value is int) ? 0 : value;
  }

  bool getBoolean(String key) {
    Object value = items[key];
    return value == null || !(value is bool) ? false : value;
  }

  bool isAdminItem() {
    return getBoolean(IS_ADMIN);
  }

  void updateItems({bool updateTime = true, int delaySeconds = 0}) async {
    Future.delayed(Duration(seconds: delaySeconds), () async {
      //bool connected = await isConnected();
      /*if (!connected) {
        delaySeconds = delaySeconds + 10;
        delaySeconds = delaySeconds >= 60 ? 0 : delaySeconds;
        print("not connected retrying in $delaySeconds seconds");
        updateItems(updateTime: updateTime, delaySeconds: delaySeconds);
        return;
      }*/

      String dName = items[DATABASE_NAME];
      String id = items[OBJECT_ID];

      DocumentSnapshot doc = await Firestore.instance
          .collection(dName)
          .document(id)
          .get(source: Source.server)
          .catchError((error) {
        delaySeconds = delaySeconds + 10;
        delaySeconds = delaySeconds >= 60 ? 0 : delaySeconds;
//        print("$error... retrying in $delaySeconds seconds");
        updateItems(updateTime: updateTime, delaySeconds: delaySeconds);
        return;
      });
      if (doc == null) return;
      if (!doc.exists) return;

      Map data = doc.data;
      for (String k in itemUpdate.keys) {
        data[k] = itemUpdate[k];
      }
      for (String k in itemUpdateList.keys) {
        Map update = itemUpdateList[k];
        bool add = update[ADD];
        var value = update[VALUE];

        List dataList = data[k] == null ? List() : List.from(data[k]);
        if (add) {
          if (!dataList.contains(value)) dataList.add(value);
        } else {
          dataList.removeWhere((E) => E == value);
        }
        data[k] = dataList;
      }
      for (String k in itemUpdateMap.keys) {
        Map update = itemUpdateMap[k];
        bool add = update[ADD];
        var itemKey = update[KEY];
        var itemValue = update[VALUE];

        Map dataList = data[k] == null ? Map() : Map.from(data[k]);
        if (add) {
          dataList[itemKey] = itemValue;
        } else {
          dataList.remove(itemKey);
        }
        data[k] = dataList;
      }

      if (updateTime) {
        data[UPDATED_AT] = FieldValue.serverTimestamp();
        data[TIME_UPDATED] = DateTime.now().millisecondsSinceEpoch;
      }

      doc.reference.updateData(data);
    });
  }

  void updateCountItem(String key, bool increase,
      {bool updateTime = true, int delaySeconds = 0}) async {
    Future.delayed(Duration(seconds: 1), () async {
      /*bool connected = await isConnected();
      if (!connected) {
        delaySeconds = delaySeconds + 10;
        delaySeconds = delaySeconds >= 60 ? 0 : delaySeconds;
        updateCountItem(key, increase,
            updateTime: updateTime, delaySeconds: delaySeconds);
        return;
      }*/

      String dName = items[DATABASE_NAME];
      String id = items[OBJECT_ID];

      DocumentSnapshot doc = await Firestore.instance
          .collection(dName)
          .document(id)
          .get(source: Source.server)
          .catchError((error) {
        delaySeconds = delaySeconds + 10;
        delaySeconds = delaySeconds >= 60 ? 0 : delaySeconds;
        updateCountItem(key, increase,
            updateTime: updateTime, delaySeconds: delaySeconds);
        return;
      });
      if (doc == null) return;
      if (!doc.exists) return;

      Map data = doc.data;
      var item = data[key] ?? 0;
      if (increase) {
        item = item + 1;
      } else {
        item = item - 1;
      }
      data[key] = item;

      if (updateTime) {
        data[UPDATED_AT] = FieldValue.serverTimestamp();
        data[TIME_UPDATED] = DateTime.now().millisecondsSinceEpoch;
      }

      doc.reference.setData(data);
    });
  }

  void deleteItem() {
    String dName = items[DATABASE_NAME];
    String id = items[OBJECT_ID];

    Firestore db = Firestore.instance;
    db.collection(dName).document(id).delete();
  }

  processSave(String name, bool addMyInfo) {
    items[DATABASE_NAME] = name;
    items[UPDATED_AT] = FieldValue.serverTimestamp();
    items[CREATED_AT] = FieldValue.serverTimestamp();
    items[TIME] = DateTime.now().millisecondsSinceEpoch;
    items[TIME_UPDATED] = DateTime.now().millisecondsSinceEpoch;
    if (name != (USER_BASE) && name != (APP_SETTINGS_BASE)
        //&& name != (NOTIFY_BASE)
        ) {
      if (addMyInfo) addMyDetails();
    }
  }

  void addMyDetails() {
    items[USER_ID] = userModel.getUserId();
    //items[USER_IMAGE] = userModel.getString(USER_IMAGE);
    items[FULL_NAME] = userModel.fullName;
    items[NICKNAME] = userModel.nickName;
    items[USER_IMAGE] = userModel.userImage.items;
  }

  void saveItem(String name, bool addMyInfo, {document, onComplete}) {
    processSave(name, addMyInfo);
    String objectId = items[OBJECT_ID];
    document = document ?? objectId;
//    document = document ?? getRandomId();
    Firestore.instance
        .collection(name)
        .document(document)
        .setData(items)
        .whenComplete(() {
      if (onComplete != null) onComplete();
    }).catchError((e) {
//      logError(e.code, e.message ?? e.details);
    });
  }
}

BaseModel createPhotoModel(
    {@required String urlPath,
    @required String thumbnail,
    String caption = "",
    String objectId = "",
    bool isVideo = false,
    bool isLocal = true}) {
//  if (objectId.isEmpty) objectId = getRandomId();
  return BaseModel()
    ..put(OBJECT_ID, objectId)
    ..put(URL_PATH, urlPath)
    ..put(THUMBNAIL_PATH, thumbnail)
    ..put(CAPTION, caption)
    ..put(IS_VIDEO, isVideo)
    ..put(IS_LOCAL, isLocal);
}

sendPushNotification({
  @required String title,
  @required int type,
  @required String message,
  @required String notifiedId,
  @required List parties,
  @required BaseModel notifiedOnThis,
}) {
  if (parties.isEmpty) return;

  final base = BaseModel()
    ..put(TITLE, title)
    ..put(TYPE, type)
    ..put(MESSAGE, message)
    ..put(NOTIFIED_ID, notifiedId)
    ..put(NOTIFIED_ON, notifiedOnThis.items)
    ..put(PARTIES, parties);

  base.saveItem(NOTIFY_BASE, true, document: notifiedId, onComplete: () {
    base.putInList(PARTIES, userModel.userId, false);
  });

  final ref = Firestore.instance.collection(USER_BASE);
  for (String ids in parties) {
    if (ids == userModel.userId) continue;
    ref.document(ids).get().then((value) {
      BaseModel model = BaseModel(doc: value);
      base..remove(UPDATED_AT)..remove(CREATED_AT)..remove(NOTIFIED_ON);
//      NotificationService.sendPush(
//        data: base.items,
//        title: title,
//        image: model.photo.urlPath,
//        body: message,
//        token: model.pushToken,
//        tag: '${userModel.getUserId()}${model.getUserId()}',
//      );
    });
  }
}
