part of 'app.dart';

const String MY_BALANCE = "myBalance";

const String ic_chat = 'assets/icons/ic_chat.png';
const String ic_mute = 'assets/icons/ic_mute.png';
const String ic_launcher = 'assets/icons/ic_launcher.gif';
const String ic_launcher1 = 'assets/icons/ic_launcher.png';
const String welcome2 = 'assets/icons/welcome2.gif';
const String welcome3 = 'assets/icons/welcome3.gif';
const String heart_off = 'assets/images/heart_off.png';
const String heart_on = 'assets/images/heart_on.png';
const String menu_home = 'assets/icons/menu_home.png';
const String menu_market = 'assets/icons/menu_market.png';
const String menu_portfolio = 'assets/icons/menu_portfolio.png';
const String menu_txn = 'assets/icons/menu_txn.png';
const String user_icon = 'assets/icons/user_icon.png';

/// for cchatsApp
const String wallpaper = 'Assets/images/wallpaper.jpg';
const String wallpaper1 = 'Assets/images/wallpaper1.jpg';

const int PUSH_TYPE_CHAT = 0;
const int CHAT_TYPE_TEXT = 0;
const int CHAT_TYPE_IMAGE = 1;
const int CHAT_TYPE_DOC = 2;
const int CHAT_TYPE_VIDEO = 3;
const int CHAT_TYPE_REC = 4;

const int NOTIFY_TYPE_CHAT = 0;
const int NOTIFY_TYPE_POST = 1;
const int NOTIFY_TYPE_FOLLOW = 2;
const int NOTIFY_TYPE_LIKE = 3;
const int NOTIFY_TYPE_COMMENT = 4;
const int NOTIFY_TYPE_COMMENT_LIKE = 5;
const int NOTIFY_TYPE_REPLY = 6;
const int NOTIFY_TYPE_REPLY_LIKE = 7;
const int NOTIFY_TYPE_STORY = 8;

const int REPORT_TYPE_POST = 0;
const int REPORT_TYPE_STORY = 1;
const int REPORT_TYPE_COMMENT = 2;
const int REPORT_TYPE_USER = 3;

Map<String, String> postTags = {
  "post_type_0": "General",
  "post_type_1": "Films",
  "post_type_2": "Culture",
  "post_type_3": "Fan",
  "post_type_4": "Advertisement",
  "post_type_5": "News",
  "post_type_6": "Islamic",
  "post_type_7": "Technologies",
  "post_type_8": "Music",
  "post_type_9": "Sports",
  "post_type_10": "Toys",
  "post_type_11": "Trade",
  "post_type_12": "Entertainment",
  "post_type_13": "Health",
  "post_type_14": "Cruises",
  "post_type_15": "Science",
  "post_type_16": "Innovations",
  "post_type_17": "Feed him",
};

const String OBJECT_ID = "objectId";
const String TYPE = "type";
const String IMAGE = "image";
const String IS_ICON = "isIcon";
const String TITLE = "title";
const String WEBSITE = "website";
const String DESCRIPTION = "description";
const String MESSAGE = "message";
const String FILE_URL = "fileUrl";
const String REFERENCE = "reference";
const String ADD = "add";
const String VALUE = "value";
const String KEY = "key";
const String EMAIL = "email";
const String ACCOUNT_TYPE = "accountType";
const String PASSWORD = "password";
const String MUTED = "muted";
const String BLOCKED_IDS = "blockedIds";
const String GENDER = "gender";
const String HIDDEN = "hidden";
const String USER_ID = "userId";
const String USER_IMAGE = "userImage";
const String FULL_NAME = "name";
const String IS_ADMIN = "isAdmin";
const String IS_MAUGOST = "isMaugost";
const String MY_SENT_CHAT = "mySentChat";
const String NICKNAME = "nickName";
const String DATE_OF_BIRTH = "dateOfBirth";
const String PROFESSION = "profession";
const String ABOUT_ME = "aboutMe";
const String COUNTRY = "country";
const String COUNTRY_CODE = "countryCode";
const String MOBILE_NUMBER = "mobileNumber";
const String ABOUT_US = "aboutUs";
const String PRIVACY_POLICY = "privacyPolicy";
const String TERMS_AND_CONDITIONS = "termsAndConditions";
const String PARTNERS = "partners";
const String WEB_ADDRESS = "webAddress";
const String URL_PATH = "urlPath";
const String THUMBNAIL_PATH = "thumbnailPath";
const String CAPTION = "caption";
const String IS_VIDEO = "isVideo";
const String IS_LOCAL = "isLocal";
const String PHOTOS = "photos";
const String SEARCH_PARAM = "searchParam";
const String PARTIES = "parties";
const String TRANSLATION = "translation";
const String MY_FOLLOWER_IDS = "followerIds";
const String AM_FOLLOWING_IDS = "followingIds";
const String STORY_IDS = "storyIds";
const String POSTS_IDS = "postIds";
const String INTERESTS = "interests";
const String INTEREST_SHOWN = "interestShown";
const String NOTIFIED_ID = "notifiedId";
const String NOTIFIED_ON = "notifiedOn";
const String PUSH_TOKEN = "pushToken";
const String DELETED_CHATS = "deletedChats";
const String LAST_COMMENTS = "lastComments";
const String SEEN_BY = "seenBy";
const String LIKED_BY = "likedBy";
const String REPORTED_ID = "reportedId";
const String SHOW_TRANSLATED = "showTranslated";
const String POST_ID = "postId";
const String COMMENTED_BY = "commentedBy";
const String MENTIONED_IDS = "mentionedUsers";
const String MENTIONED_HASH_TAG = "mentionedHashTag";
const String MENTIONED_PLACE = "mentionedPlace";
const String MENTIONED_PLACE_LAT = "mentionedPlaceLat";
const String MENTIONED_PLACE_LONG = "mentionedPlaceLong";
const String IS_ONLINE = "isOnline";
const String TYPING_ID = "typingId";
const String VIDEO_LENGTH = "videoLength";
const String AUDIO_LENGTH = "audioLength";
const String AUDIO_URL = "audioUrl";
const String AUDIO_PATH = "audioPath";
const String CHAT_ID = "chatId";
const String READ_BY = "readBy";
const String DELETED = "deleted";
const String AM_INTERESTED = "amInterested";
const String PLATFORM = "platform";
const String ANDROID = "android";
const String IOS = "ios";
const String WEB = "web";

const String VIDEO_AUTO_PLAY = "videoAutoPlay";
const String VIDEO_AUTO_MUTE = "videoAutoMute";

const String PUSH_NOTIFICATIONS = "pushNotifications";
const String EMAIL_NOTIFICATIONS = "email_notifications";
const String SMS_NOTIFICATIONS = "library_notifications";
const String CHAT_NOTIFICATIONS = "chat_notifications";

const String DATABASE_NAME = "dataBaseName";
const String CREATED_AT = "createdAt";
const String UPDATED_AT = "updatedAt";
const String TIME_UPDATED = "timeUpdated";
const String TIME = "time";
const String TIME_ONLINE = "timeOnline";

const String USER_BASE = "userBase";
const String REFERENCE_BASE = "ReferenceBase";

const String PROPERTY_BASE = "propertyBase";
const String APP_SETTINGS = "appSettings";
const String APP_SETTINGS_BASE = "appSettingsBase";
const String NOTIFY_BASE = "notifyBase";
const String POST_BASE = "postBase";
const String COMMENT_BASE = "commentBase";
const String REPLY_BASE = "replyBase";
const String PARTNER_BASE = "partnerBase";

const String NOTE_BASE = "noteBase";
const String STORY_BASE = "storyBase";
const String REPORT_BASE = "reportBase";
const String CHAT_BASE = "chatBase";
const String SUGGESTION_BASE = "suggestionBase";
const String DOWNLOAD_BASE = "downloadBase";
const String HOUSE_BOUGHT = "houseBought";
const String LAND_BOUGHT = "landBought";
const String PROPERTIES_BOUGHT = "propertiesBought";

const String USERS = "Users";
const String PERFORMANCE = "Performance";
const String PORTFOLIO = "Portfolio";
const String MARKET_PLACE = "Market Place";
const String ADD_PROPERTY = "Add Property";
const String ADD_HOUSE = "Add house";
const String ADD_LAND = "Add Land";
const String REPORTS = "Reports";
const String TOTAL_AMOUNT = "Total Amount";
const String PENDING_TRANSACTIONS = "Pending Tranctions";
const String report = "assets/images/report.png";
const String amount = "assets/images/amount.png";
const String pending = "assets/images/pending.png";
const String bed = "assets/images/bed.png";
const String bed2 = "assets/images/bed2.png";
const String land = "assets/images/land.png";
const String bathroom = "assets/images/bathroom.png";
const String house = "assets/images/house.png";
const String images = "assets/images/images.png";
const String map = "assets/images/map.png";
const String street = "assets/images/street.jpeg";
const String road = "assets/images/road.jpg";
const String logout = "assets/images/logout.png";
const String copy = "assets/images/copy.png";
const String prop = "assets/images/prop.jpg";

const String AMOUNT_PER_SLOT = "AmountPerSlot";
const String SLOTS_AVAILABLE = "slotsavailable";
const String SLOTS_SIZE = "slotSize";
const String SLOT_AMOUNT = "slotAmount";
const String SURVEY_PLAN = "surveyPlan";
const String MORE_DETAILS = "moreDetails";
const String INSTALLMENT_PLAN_TYPE = "installmentPLanType";
const String BEDROOMS = "bedrooms";
const String BATHROOMS = "bathrooms";
const String POST_TYPE = "postType";
const String PROPERTY_TYPE = "propertyType";
const String MAP_AREA = "mapArea";
const String PAYMENT_TIME = "paymentTime";
const String PAYMENT_TIME_TYPE = "paymentTimeType";
const String MIN_PAYMENT = "paymentTime";
const String MAP_LOCATION = "mapLocation";
const String MAP_DESCRIPTION = "mapDescription";
const String MAP_POINTS = "mapPoints";
const String MAP_ZOOM = "mapZoom";
const String MAP_INFO = "mapInfo";
const String NAIRA_SYMBOL = "₦";
const String REF_CODE = "refCode";
const String REFERRED_BY = "referredBy";
const String REFERRALS = "referrals";
const String IS_REFERRED = "isReferred";
