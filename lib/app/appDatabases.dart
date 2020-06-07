part of 'app.dart';

class AppDataBase {
  static const String userBase = 'userBase';
  static const String chatBase = 'chatBase';
  static const String contactBase = 'contactBase';
  static const String referenceBase = 'referenceBase';
  static const String appSettingsBase = 'appSettingsBase';
  static const String appSettings = 'appSettings';
  static const String postBase = 'postBase';
  static const String storiesBase = 'storiesBase';
  static const String commentBase = 'commentBase';
  static const String notesBase = 'notesBase';
  static const String notificationBase = 'notificationBase';
  static const String chat_ids_base = "chatIdsBase";
  static const String chat_base = "chatBase";

  static saveItem(T,
      {String documentId,
      bool addMyInfo = false,
      String databaseName,
      onComplete,
      onError}) {
    final toJson = T.toStringJson();

    //to update the time
    T = T.rebuild((b) => b..updatedAt= DateTime.now().millisecondsSinceEpoch);

    Firestore.instance
        .collection(null == databaseName ? T.dataBase : databaseName)
        .document(null == documentId ? T.documentId : documentId)
        .setData(jsonDecode(toJson))
        .then((value) {
      if (null != onComplete) onComplete();
    }).catchError((e) {
      if (null != onError) onError(e);
    });
  }

}
