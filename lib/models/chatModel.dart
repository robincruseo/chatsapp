class ChatModel {
//  final String profileImage;
  final String profileName;
  final String imagePath;
  final String message;

  ChatModel(this.profileName, this.imagePath, this.message);
}

class Constants {
  static const String directMessage = 'New chat';
  static const String groupMessage = 'New group';
  static const String StarredMessages = 'Starred Messages';
  static const String ChatsAppWeb = 'ChatsApp Web ';
  static const String Restart = 'Restart chatsApp';
  static const String Settings = 'Settings';
  static const String Search = 'Search';
  static const String StatusSettings = 'Status settings';
  static const String CallRestriction = 'Who can call me?';
  static const String ClearLog = 'Clear call log';
  static const String ViewContact = 'View contact';
  static const String mediaLinks = 'Media, Links, and docs';
  static const String muteNotifications = 'Mute notifications';
  static const String wallpaper = 'Wallpaper';
  static const String searchWeb = 'Search web';
  static const String firstMessage = 'Go to first message';
  static const String clearEmoji = 'Clear Recent Emojis';
  static const String lockChat = 'Lock conversation';

  static const List<String> chatDiaglog = <String>[
    directMessage,
    groupMessage,
    StarredMessages,
    ChatsAppWeb,
    Restart,
    Settings
  ];

  static const List<String> statusSettings = [StatusSettings, Settings];
  static const List<String> dmSettings = [
    ViewContact,
    mediaLinks,
    Search,
    muteNotifications,
    wallpaper,
    firstMessage,
    searchWeb,
    clearEmoji,
    lockChat
  ];

  static const List<String> callSettings = [
    CallRestriction,
    ClearLog,
    Settings
  ];
}
