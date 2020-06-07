library app;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:chatsapp/app_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:meta/meta.dart';

part 'appAssets.dart';
part 'appDatabases.dart';
part 'appExtensions.dart';
part 'baseModel.dart';
part 'colors.dart';
part 'dotsIndicator.dart';
part 'infoDialog.dart';
part 'inputDialog.dart';
part 'listDialog.dart';
part 'messageDialog.dart';
part 'navigation.dart';
part 'progressDialog.dart';
//part 'rating.dart';
//part 'unicons.dart';

class Countries {
  final String countryName;
  final String countryFlag;
  final String countryCode;

  Countries({this.countryName, this.countryFlag, this.countryCode});
}

Locale appLocale = Locale('en');
bool isLoggedIn = false;
bool isAdmin = false;
String currentProgress = "";
bool showProgressLayout = false;
//final progressId = getRandomId();
//String get objectId => getRandomId();
StreamSubscription usersStream;
StreamSubscription appSettingsStream;
bool hasChatLoaded = false;
List<BaseModel> allMessages = List();

bool notesLoaded = false;
List<BaseModel> myNotes = List();

bool partnersLoaded = false;
List<BaseModel> appPartners = List();

bool notifyLoaded = false;
List<BaseModel> myNotifications = List();

bool postsLoaded = false;
List<BaseModel> myPosts = List();
List<BaseModel> otherPosts = List();
List<BaseModel> allPosts = List();

bool propertiesLoaded = false;
List<BaseModel> allProperties = List();
List<BaseModel> allPortfolios = List();
bool portfolioLoaded = false;

//bool loadedMyStories = false;
//List<BaseModel> allStories = List();
//List<BaseModel> myStories = List();
//List<BaseModel> otherStories = List();

final List<String> imageFolders = [];
//final List<MediaFile> allMediaFileList = [];
//List<MediaFile> selectedMediaList = [];

bool hasSetup = false;
bool isPosting = false;
bool isPostingStory = false;

//List<CameraDescription> cameras = [];
var notificationsPlugin = FlutterLocalNotificationsPlugin();

BaseModel userModel = BaseModel();
BaseModel appSettingsModel = BaseModel();
List<BaseModel> myFollowers = [];
List<BaseModel> amFollowing = [];
List<File> trimmedVideoFrames = [];
List<File> trimmedThumbFrames = [];
List<String> uploadingPost = [];

Map otherPeronInfo = Map();
Map unreadCounter = Map();
List<BaseModel> lastMessages = List();
bool chatSetup = false;
List showNewMessageDot = [];
StreamController<bool> chatMessageController =
    StreamController<bool>.broadcast();
List<String> stopListening = List();
String visibleChatId = "";
int timeOnline = 0;

final scrollControllers = List.generate(3, (p) => ScrollController());
//VideoPlayerController videoController;
bool canPlayVideo = true;
//Countries country =
////    getCountries().singleWhere((element) => element.countryName == 'Nigeria');
////final accountTypes = ["Individual Account", "Business Account"];
//final propertyType = ["Add House", "Add Land"];
//List<String> installmentType = ["Available", "Not Available"];
//List<String> postType = ["As Normal Deals", "As Hot Deals"];
//List<String> paymentType = [
//  "Days",
//  "Weeks",
//  "Months",
//];
List<String> propertyTypes = ["House Property", "Land Property"];
