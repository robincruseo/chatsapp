//part of 'app.dart';
//
////class CodeWheeler {
////  final int milliseconds;
////  VoidCallback action;
////  Timer _timer;
////  int page = 0;
////
////  CodeWheeler({this.milliseconds});
////
////  run(Function action) {
////    if (null != _timer) {
////      _timer.cancel();
////    }
////    _timer = Timer.periodic(Duration(milliseconds: milliseconds), (_) {
////      action();
////    });
////  }
////
////  close() {
////    _timer?.cancel();
////  }
////}
////
//
////import 'package:flutter/material.dart';
////
////import '../app_config.dart';
//
//////List<Countries> getCountries() {
//////  return countryMap
//////      .map((c) => Countries(
//////          countryName: c["Name"],
//////          countryCode: '+${c["Code"]}',
//////          countryFlag: 'flags/${c["ISO"]}.png'))
//////      .toList();
//////}
////
////String getTimerText(int seconds, {bool three = false}) {
////  int hour = seconds ~/ Duration.secondsPerHour;
////  int min = (seconds ~/ 60) % 60;
////  int sec = seconds % 60;
////
////  String h = hour.toString();
////  String m = min.toString();
////  String s = sec.toString();
////
////  String hs = h.length == 1 ? "0$h" : h;
////  String ms = m.length == 1 ? "0$m" : m;
////  String ss = s.length == 1 ? "0$s" : s;
////
////  return three ? "$hs:$ms:$ss" : "$ms:$ss";
////}
////
//textStyle(bool bold, double size, color,
//    {underlined = false,
//    //String font = "Lato",
//    bool padd = true,
//    decorationColor = AppConfig.appColor}) {
//  return TextStyle(
//      color: color,
//      //fontWeight: bold ? FontWeight.w900 : FontWeight.normal,
//      //fontFamily: font,
//      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
//      // fontWeight:bold?FontWeight.bold: null,//FontWeight.normal,
//      fontFamily: bold ? "AvertaB" : "Averta",
//      fontSize: size,
//      decorationColor: decorationColor,
//      decorationThickness: 1,
//      //decorationStyle: TextDecorationStyle.solid,
//      decoration: underlined ? TextDecoration.underline : TextDecoration.none);
//}
//
//pushAndResult(context, item, {result}) {
//  Navigator.push(
//      context,
//      PageRouteBuilder(
//          transitionsBuilder: transition,
//          opaque: false,
//          pageBuilder: (context, _, __) {
//            return item;
//          })).then((_) {
//    if (_ != null) {
//      if (null != result) result(_);
//    }
//  });
//}
//
//Widget transition(BuildContext context, Animation<double> animation,
//    Animation<double> secondaryAnimation, Widget child) {
//  return FadeTransition(
//    opacity: animation,
//    child: child,
//  );
//}
//
//SizedBox addSpace(double size) {
//  return SizedBox(
//    height: size,
//  );
//}
//
////
//addSpaceWidth(double size) {
//  return SizedBox(
//    width: size,
//  );
////}
////
////tipBox(color, text, textColor) {
////  return Container(
////    //width: double.infinity,
////    color: color,
////    child: Padding(
////      padding: const EdgeInsets.all(10.0),
////      child: Row(
////        //mainAxisSize: MainAxisSize.max,
////        children: <Widget>[
////          Icon(
////            Icons.info,
////            size: 14,
////            color: white,
////          ),
////          addSpaceWidth(10),
////          Flexible(
////            flex: 1,
////            child: Text(
////              text,
////              style: textStyle(false, 15, textColor),
////            ),
////          )
////        ],
////      ),
////    ),
////  );
////}
////
////tipMessageItem(String title, String message, {Color color}) {
////  return Container(
////    child: new Card(
////        color: color ?? red01,
////        elevation: .5,
////        clipBehavior: Clip.antiAlias,
////        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
////        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
////        child: new Padding(
////          padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
////          child: Column(
////            crossAxisAlignment: CrossAxisAlignment.start,
////            mainAxisSize: MainAxisSize.min,
////            children: <Widget>[
////              Row(
////                crossAxisAlignment: CrossAxisAlignment.center,
////                children: <Widget>[
////                  Icon(
////                    Icons.info,
////                    size: 14,
////                    color: white,
////                  ),
////                  addSpaceWidth(5),
////                  Text(
////                    title,
////                    style: textStyle(true, 12, white.withOpacity(.5)),
////                  ),
////                ],
////              ),
////              addSpace(5),
////              Text(
////                message,
////                style: textStyle(false, 16, white),
////                //overflow: TextOverflow.ellipsis,
////              ),
////              /*Container(
////                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
////                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
////                decoration: BoxDecoration(
////                    color: white, borderRadius: BorderRadius.circular(3)),
////                child: Text(
////                  "APPLY",
////                  style: textStyle(true, 9, black),
////                ),
////              ),*/
////            ],
////          ),
////        )),
////  );
////}
////
//
//  dropDownSelector(String value,
//      {String title,
//      String hint = 'Select a dropdown value',
//      bool showImage = false,
//      bool isNet = false,
//      bool showTitle = false,
//      IconData icon,
//      String image,
//      Color titleColor = black,
//      double titleOpacity = .8,
//      TextStyle style,
//      onTap}) {
//    style = style ?? textStyle(false, 14, titleColor.withOpacity(titleOpacity));
//    return Container(
//      padding: EdgeInsets.all(10),
//      child: Column(
//        mainAxisSize: MainAxisSize.min,
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          if (showTitle) ...[
//            Text(title, style: style:textStyle(false, 14, titleColor.withOpacity(titleOpacity)),
//                ),
//            10.spaceHeight(),
//          ],
//          FlatButton(
//            onPressed: onTap,
//            padding: 15.padAll(),
//            color: black.withOpacity(.03),
//            shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(10),
//                side: BorderSide(color: white.withOpacity(.6))),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Flexible(
//                  child: Row(
//                    children: <Widget>[
//                      if (showImage) ...[
//                        if (isNet)
//                          Image.network(
//                            image,
//                            height: 25,
//                            width: 40,
//                            fit: BoxFit.cover,
//                          )
//                        else
//                          Image.asset(
//                            image,
//                            height: 25,
//                            width: 40,
//                            fit: BoxFit.cover,
//                          ),
//                        15.spaceWidth()
//                      ],
//                      Flexible(
//                        child: Text(
//                          value ?? hint,
//                          style: textStyle(false, 14,
//                              titleColor.withOpacity(null == value ? 0.5 : 1)),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//                Icon(
//                  icon ?? Icons.arrow_drop_down,
//                  color: titleColor.withOpacity(.5),
//                )
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
////
////inputFieldView(
////    {String hint,
////    TextEditingController controller,
////    bool showPhone = false,
////    bool showTitle = false,
////    String title,
////    TextStyle style,
////     Color titleColor = black,
////    double titleOpacity = .8,
////    String countryCode,
////    onCountryTapped,
////    TextInputType keyboardType = TextInputType.text,
////    String validator(String value)}) {
////      style = style ?? textStyle(false, 14, titleColor.withOpacity(titleOpacity));
////  final borderDeco = OutlineInputBorder(
////      borderRadius: BorderRadius.circular(10),
////      borderSide: BorderSide(color: white.withOpacity(.6)));
////
////  return Container(
////    padding: EdgeInsets.all(10),
////    //height: 130,
////    child: Column(
////      crossAxisAlignment: CrossAxisAlignment.start,
////      mainAxisSize: MainAxisSize.min,
////      children: <Widget>[
////        if (showTitle) ...[
////          Text(
////            title,
////            style: style,
////          ),
////          10.spaceHeight(),
////        ],
////        Row(
////          mainAxisAlignment: MainAxisAlignment.start,
////          crossAxisAlignment: CrossAxisAlignment.start,
////          children: <Widget>[
////            if (showPhone) ...[
////              FlatButton(
////                  onPressed: onCountryTapped,
////                  color: black.withOpacity(.04),
////                  padding: 18.padAll(),
////                  shape: RoundedRectangleBorder(
////                      borderRadius: BorderRadius.circular(10),
////                      side: BorderSide(color: white.withOpacity(.5))),
////                  child: Text(
////                    countryCode ?? "+234",
////                    style: textStyle(false, 16, white.withOpacity(1)),
////                  )),
////              10.spaceWidth()
////            ],
////            Flexible(
////              child: TextFormField(
////                controller: controller,
////                keyboardType: keyboardType,
////                style: textStyle(false, 15, white),
////                validator: validator,
////                decoration: InputDecoration(
////                    contentPadding: 18.padAll(),
////                    hintText: hint,
////                    hintStyle: textStyle(false, 15, white.withOpacity(.5)),
////                    fillColor: black.withOpacity(.04),
////                    filled: true,
////                    enabledBorder: borderDeco,
////                    focusedBorder: borderDeco,
////                    border: borderDeco),
////              ),
////            )
////          ],
////        ),
////      ],
////    ),
////  );
////}
////
////authInputField(
////    {@required TextEditingController controller,
////    String title,
////    String hint,
////    TextStyle hintStyle,
////    TextStyle style,
////    bool isPassword = false,
////    bool showPassword = false,
////    int maxLines,
////    int maxLength,
////      onPassChanged,
////
////    Color titleColor = black,
////    onEditingComplete,
////    FocusNode focusNode,
////    double titleOpacity = .6,
////    String validator(String value),
////    TextInputType inputType = TextInputType.text}) {
////  hintStyle = hintStyle ?? textStyle(false, 14, titleColor.withOpacity(.5));
////style = style ?? textStyle(false, 14, titleColor.withOpacity(titleOpacity));
////  final borderDeco = OutlineInputBorder(
////      borderRadius: BorderRadius.circular(8),
////      borderSide: BorderSide(color: white.withOpacity(.5)));
////
////  return Container(
////    padding: EdgeInsets.all(10),
////    child: Column(
////      crossAxisAlignment: CrossAxisAlignment.start,
////      mainAxisSize: MainAxisSize.min,
////      children: <Widget>[
////        Text(
////          title,
////          //style: textStyle(true, 14, white.withOpacity(.8)),
////          style:style
////          //  textStyle(false, 14, titleColor.withOpacity(titleOpacity)),
////        ),
////        10.spaceHeight(),
////        TextFormField(
////          keyboardType: inputType,
////          focusNode: focusNode,
////          controller: controller,
////          validator: validator,
////          autofocus: false,
////          textInputAction: TextInputAction.next,
////          onEditingComplete: onEditingComplete,
////          obscureText: showPassword,
////          style: style,
////          maxLength: maxLength,
////          maxLines: isPassword ? 1 : maxLines,
////          decoration: InputDecoration(
////              enabledBorder: borderDeco,
////              focusedBorder: borderDeco,
////              border: borderDeco,
////              hintText: hint,
////
////              hintStyle: hintStyle,
////              fillColor: black.withOpacity(.04),
////              filled: true,
////              suffixIcon: isPassword
////                  ? Container(
////                      margin: 5.padAtRight(),
////                      decoration: BoxDecoration(
////                          //color: AppConfig.appColor,
////                          color: black.withOpacity(.4),
////                          borderRadius: BorderRadius.circular(8)),
////                      child: IconButton(
////                          icon: Icon(
////                            showPassword
////                                ? Icons.visibility_off
////                                : Icons.visibility,
////                            color: white,
////                          ),
////                          onPressed: onPassChanged),
////                    )
////                  : null),
////        ),
////      ],
////    ),
////  );
////}
////
////imageHolder(
////  double size,
////  imageUrl, {
////  double stroke = 0,
////  strokeColor = AppConfig.appColor,
////  localColor,
////  margin,
////  bool local = false,
////  bool hideIcon = false,
////  iconHolder = Icons.person,
////  stackHolder = Icons.star,
////  double iconHolderSize = 14,
////  double localPadding = 0,
////  bool round = true,
////  bool borderCurve = false,
////  bool showDot = false,
////  bool showStack = false,
////  double curve = 20,
////  dotColor,
////  onImageTap,
////}) {
////  return GestureDetector(
////    onTap: onImageTap,
////    child: ClipRRect(
////      borderRadius: BorderRadius.circular(borderCurve ? curve : 0),
////      child: AnimatedContainer(
////        curve: Curves.ease,
////        margin: margin,
////        alignment: Alignment.center,
////        duration: Duration(milliseconds: 300),
////        padding: EdgeInsets.all(stroke),
////        decoration: BoxDecoration(
////          color: strokeColor,
////          //borderRadius: BorderRadius.circular(borderCurve ? 15 : 0),
////          //border: Border.all(width: 2, color: white),
////          shape: round ? BoxShape.circle : BoxShape.rectangle,
////        ),
////        width: size,
////        height: size,
////        child: Stack(
////          alignment: Alignment.bottomRight,
////          children: <Widget>[
////            new Card(
////              margin: EdgeInsets.all(0),
////              shape: round
////                  ? CircleBorder()
////                  : RoundedRectangleBorder(
////                      borderRadius: BorderRadius.circular(5)),
////              clipBehavior: Clip.antiAlias,
////              color: Colors.transparent,
////              elevation: .5,
////              child: Stack(
////                alignment: Alignment.center,
////                children: <Widget>[
////                  Container(
////                    width: size,
////                    height: size,
////                    child: hideIcon
////                        ? null
////                        : Center(
////                            child: Icon(
////                            iconHolder,
////                            color: white,
////                            size: iconHolderSize,
////                          )),
////                  ),
////                  imageUrl is File
////                      ? (Image.file(
////                          imageUrl,
////                          width: size,
////                          height: size,
////                          alignment: Alignment.topCenter,
////                          fit: BoxFit.cover,
////                        ))
////                      : local
////                          ? Padding(
////                              padding: EdgeInsets.all(localPadding),
////                              child: Image.asset(
////                                imageUrl,
////                                width: size,
////                                height: size,
////                                color: localColor ?? white,
////                                fit: BoxFit.cover,
////                              ),
////                            )
////                          : CachedNetworkImage(
////                              width: size,
////                              height: size,
////                              imageUrl: imageUrl,
////                              fit: BoxFit.cover,
////                              alignment: Alignment.topCenter,
////                            ),
////                ],
////              ),
////            ),
////            if (showStack)
////              Container(
////                width: 22,
////                height: 22,
////                padding: EdgeInsets.all(3),
////                child: Icon(
////                  stackHolder,
////                  color: white,
////                  size: 12,
////                ),
////                decoration: BoxDecoration(
////                  shape: BoxShape.circle,
////                  border: Border.all(color: white, width: 2),
////                  color: AppConfig.appColor,
////                ),
////              ),
////            if (showDot)
////              Container(
////                width: 15,
////                height: 15,
////                decoration: BoxDecoration(
////                  shape: BoxShape.circle,
////                  border: Border.all(color: white, width: 2),
////                  color: dotColor ?? dark_green0,
////                ),
////              ),
////          ],
////        ),
////      ),
////    ),
////  );
////}
////
////loadingLayout({Color color, Color load, bool showIndicator = false}) {
////  return new Container(
////    color: color ?? white,
////    child: Stack(
////      fit: StackFit.expand,
////      children: <Widget>[
////        if (showIndicator)
////          Center(
////            child: SizedBox(
////              height: 90,
////              width: 90,
////              child: LoadingIndicator(
////                indicatorType: Indicator.orbit,
////                color: AppConfig.appColor,
////              ),
////            ),
////          ),
////        Center(
////          child: Opacity(
////            opacity: .3,
////            child: ClipRRect(
////              borderRadius: BorderRadius.circular(25),
////              child: Image.asset(
////                AppConfig.appIcon,
////                width: 50,
////                height: 50,
////              ),
////            ),
////          ),
////        ),
////        Center(
////          child: CircularProgressIndicator(
////            //value: 20,
////            valueColor: AlwaysStoppedAnimation<Color>(load ?? white),
////            strokeWidth: 2,
////          ),
////        ),
////      ],
////    ),
////  );
////}
////
////emptyLayout(icon, String title, String text,
////    {click, clickText, bool isIcon = false}) {
////  return Container(
////    color: white,
////    child: Center(
////      child: Padding(
////        padding: const EdgeInsets.all(15.0),
////        child: Column(
////          mainAxisSize: MainAxisSize.min,
////          crossAxisAlignment: CrossAxisAlignment.center,
////          children: <Widget>[
////            if (isIcon)
////              Icon(
////                icon,
////                size: 100,
////                color: AppConfig.appColor,
////              )
////            else
////              Image.asset(
////                icon,
////                height: 100,
////                width: 100,
////              ),
//////            new Container(
//////              width: 50,
//////              height: 50,
//////              child: Stack(
//////                children: <Widget>[
//////                  new Container(
//////                    height: 50,
//////                    width: 50,
//////                    decoration:
//////                        BoxDecoration(color: red0, shape: BoxShape.circle),
//////                  ),
//////                  new Center(
//////                      child: isIcon
//////                          ? Icon(
//////                              icon,
//////                              size: 30,
//////                              color: white,
//////                            )
//////                          : Image.asset(
//////                              icon,
//////                              height: 30,
//////                              width: 30,
//////                              color: white,
//////                            )),
//////                  new Container(
//////                    child: Column(
//////                      mainAxisSize: MainAxisSize.max,
//////                      crossAxisAlignment: CrossAxisAlignment.end,
//////                      children: <Widget>[
//////                        addExpanded(),
//////                        Container(
//////                          width: 20,
//////                          height: 20,
//////                          decoration: BoxDecoration(
//////                              color: red3,
//////                              shape: BoxShape.circle,
//////                              border: Border.all(color: white, width: 1)),
//////                          child: Center(
//////                            child: Text(
//////                              "!",
//////                              style: textStyle(true, 14, white),
//////                            ),
//////                          ),
//////                        )
//////                      ],
//////                    ),
//////                  )
//////                ],
//////              ),
//////            ),
////            addSpace(10),
////            Container(
////              padding: EdgeInsets.all(10),
////              decoration: BoxDecoration(
////                  color: black.withOpacity(.03),
////                  borderRadius: BorderRadius.only(
////                      topRight: Radius.circular(15),
////                      bottomRight: Radius.circular(15),
////                      bottomLeft: Radius.circular(15))),
////              child: Text(
////                title,
////                style: textStyle(true, 16, black.withOpacity(.7)),
////                textAlign: TextAlign.center,
////              ),
////            ),
////            addSpace(5),
////            Text(
////              text,
////              style: textStyle(false, 14, black.withOpacity(.5)),
////              textAlign: TextAlign.center,
////            ),
////            addSpace(10),
////            click == null
////                ? new Container()
////                : FlatButton(
////                    shape: RoundedRectangleBorder(
////                        borderRadius: BorderRadius.circular(25)),
////                    color: dark_green0,
////                    onPressed: click,
////                    child: Text(
////                      clickText,
////                      style: textStyle(true, 14, white),
////                    ))
////          ],
////        ),
////      ),
////    ),
////  );
////}
////
////toast(scaffoldKey, text, {Color color}) {
////  return scaffoldKey.currentState.showSnackBar(new SnackBar(
////    content: Padding(
////      padding: const EdgeInsets.all(0.0),
////      child: Text(
////        text,
////        style: textStyle(false, 15, white),
////      ),
////    ),
////    backgroundColor: color,
////    duration: Duration(seconds: 2),
////  ));
////}
////
////Container addLine(
////    double size, color, double left, double top, double right, double bottom) {
////  return Container(
////    height: size,
////    width: double.infinity,
////    color: color,
////    margin: EdgeInsets.fromLTRB(left, top, right, bottom),
////  );
////}
////
////void showProgress(bool show, String progressId, BuildContext context,
////    {String msg, bool cancellable = false, double countDown}) {
////  if (!show) {
////    currentProgress = progressId;
////    return;
////  }
////
////  currentProgress = "";
////
////  pushAndResult(
////      context,
////      progressDialog(
////        progressId,
////        message: msg,
////        cancelable: cancellable,
////      ));
////}
////
////void showMessage(context, icon, iconColor, title, message,
////    {int delayInMilli = 0,
////    clickYesText = "OK",
////    onClicked,
////    clickNoText,
////    bool cancellable = false,
////    double iconPadding,
////    bool isIcon = true}) {
////  Future.delayed(Duration(milliseconds: delayInMilli), () {
////    pushAndResult(
////        context,
////        messageDialog(
////          icon,
////          iconColor,
////          title,
////          message,
////          clickYesText,
////          noText: clickNoText,
////          cancellable: cancellable,
////          isIcon: isIcon,
////          iconPadding: iconPadding,
////        ),
////        result: onClicked);
////  });
////}
////
////void showListDialog(
////  context,
////  items, {
////  images,
////  title,
////  onClicked,
////  useIcon = true,
////  usePosition = true,
////  useTint = false,
////  int delayInMilli = 0,
////}) {
////  Future.delayed(Duration(milliseconds: delayInMilli), () {
////    pushAndResult(
////        context,
////        listDialog(
////          items,
////          title: title,
////          images: images,
////          isIcon: useIcon,
////          usePosition: usePosition,
////          useTint: useTint,
////        ),
////        result: onClicked);
////  });
////}
////
////String getRandomId() {
////  var uuid = new Uuid();
////  return uuid.v1();
////}
////
//////Future<File> cropThisImage(String path, {bool circle = false}) async {
////////  return await ImageCropper.cropImage(
////////      sourcePath: path,
////////      cropStyle: circle ? CropStyle.circle : CropStyle.rectangle,
////////      aspectRatioPresets: [
////////        CropAspectRatioPreset.square,
////////        CropAspectRatioPreset.ratio3x2,
////////        CropAspectRatioPreset.original,
////////        CropAspectRatioPreset.ratio4x3,
////////        CropAspectRatioPreset.ratio16x9
////////      ],
//////      androidUiSettings: AndroidUiSettings(
//////          toolbarTitle: 'Cropper',
//////          toolbarColor: AppConfig.appColor,
//////          toolbarWidgetColor: Colors.white,
//////          initAspectRatio: CropAspectRatioPreset.original,
//////          lockAspectRatio: false),
//////      iosUiSettings: IOSUiSettings(
//////        minimumAspectRatio: 1.0,
//////      ));
//////}
////
//////getSingleCroppedImage(BuildContext context,
//////    {@required onPicked(BaseModel photo),
//////    bool crop = false,
//////    bool circle = false}) async {
//////  PhotoPicker.openPicker(
//////    mediaType: 'image', // image | video | any
//////    multiple: false,
//////    limit: 1,
//////  ).then((value) async {
//////    String urlPath = value[0].url.replaceAll("file://", "");
//////    String thumbnail = value[0].thumbnailUrl.replaceAll("file://", "");
//////
//////    if (crop) {
//////      File file = await cropThisImage(urlPath, circle: circle);
//////      if (null == file) return;
//////      final photo = createPhotoModel(urlPath: file.path, thumbnail: thumbnail);
//////      onPicked(photo);
//////      return;
//////    }
//////
//////    final photo = createPhotoModel(urlPath: urlPath, thumbnail: thumbnail);
//////    onPicked(photo);
//////  }).catchError((e) {
//////    logError(e.code, e.message);
//////  });
//////  ;
//////}
////
//////getSingleVideo(BuildContext context,
//////    {@required onPicked(BaseModel photo)}) async {
//////  PhotoPicker.openPicker(
//////    mediaType: 'video', // image | video | any
//////    multiple: false,
//////    limit: 1,
//////  ).then((value) {
//////    List<BaseModel> path = value.map((e) {
//////      return createPhotoModel(
//////          urlPath: e.url.replaceAll("file://", ""),
//////          thumbnail: e.thumbnailUrl.replaceAll("file://", ""),
//////          isVideo: true);
//////    }).toList();
//////    onPicked(path[0]);
//////  }).catchError((e) {
//////    logError(e.code, e.message);
//////  });
//////  ;
//////}
////
//////uploadFile(File file, onComplete(Uploader res, error)) {
//////  final String ref = getRandomId();
//////  StorageReference storageReference = FirebaseStorage.instance.ref().child(ref);
//////  StorageUploadTask uploadTask = storageReference.putFile(file);
//////  uploadTask.onComplete
//////      /*.timeout(Duration(seconds: 3600), onTimeout: () {
//////    onComplete(null, "Error, Timeout");
//////  })*/
//////      .then((task) {
//////    if (task != null) {
//////      task.ref.getDownloadURL().then((_) {
//////        final uploader = Uploader((b) => b
//////          ..fileUrl = _.toString()
//////          ..documentId = ref
//////          ..reference = ref
//////          ..dataBase = AppDataBase.referenceBase);
//////        AppDataBase.saveItem(uploader, onComplete: () {
//////          //onComplete(_.toString(), null);
//////          onComplete(uploader, null);
//////        }, onError: (e) {
//////          onComplete(null, e);
//////        });
//////      }, onError: (error) {
//////        onComplete(null, error);
//////      });
//////    }
//////  }, onError: (error) {
//////    onComplete(null, error);
//////  });
//////}
////
//  ///*uploadMediaFiles(List<BaseModel> photos,
////    {onUploaded(List<BaseModel> uploaded), onError}) {
////  List<BaseModel> upload = [];
////  for (int p = 0; p < photos.length; p++) {
////    BaseModel photo = photos[p];
////    bool isLocal = photo.isLocal;
////    bool isVideo = photo.isVideo;
////    String id = photo.getObjectId();
////    if (isLocal) {
////      File file = File(photo.urlPath);
////      uploadFile(file, (Uploader up, err) {
////        if (null != err) {
////          onError(err);
////          return;
////        }
////        final upPhoto = createPhotoModel(
////            urlPath: up.fileUrl, thumbnail: "", objectId: up.documentId);
////
////        if (isVideo) {
////          File thumbFile = File(photo.thumbnailPath);
////          uploadFile(thumbFile, (res, error) {
////            if (null != err) {
////              onError(err);
////              return;
////            }
////            upPhoto
////              ..put(THUMBNAIL_PATH, res.fileUrl)
////              ..put(IS_LOCAL, false)
////              ..put(IS_VIDEO, true);
////            upload.add(upPhoto);
////            if (p == photos.length - 1) {
////              onUploaded(upload);
////            }
////          });
////          return;
////        }
////
////        upload.add(upPhoto);
////        if (p == photos.length - 1) {
////          onUploaded(upload);
////        }
////      });
////    } else {
////      upload.add(photo);
////      if (p == photos.length - 1) {
////        onUploaded(upload);
////      }
////    }
////  }
////}*/
////
//////uploadMediaFiles(List<BaseModel> photos,
//////    {onUploaded(List<BaseModel> uploaded), onError}) {
//////  List<BaseModel> upload = [];
//////  for (int p = 0; p < photos.length; p++) {
//////    BaseModel photo = photos[p];
//////    bool isLocal = photo.isLocal;
//////    bool isVideo = photo.isVideo;
//////    if (isLocal) {
//////      File file = File(photo.urlPath);
//////      uploadFile(file, (Uploader up, err) {
//////        if (null != err) {
//////          onError(err);
//////          return;
//////        }
//////
//////        if (isVideo) {
//////          File thumbFile = File(photo.thumbnailPath);
//////          uploadFile(thumbFile, (res, error) {
//////            if (null != err) {
//////              onError(err);
//////              return;
//////            }
//////
//////            final upPhoto = createPhotoModel(
//////                urlPath: up.fileUrl,
//////                thumbnail: res.fileUrl,
//////                isVideo: true,
//////                isLocal: false,
//////                objectId: up.documentId);
//////
//////            upload.add(upPhoto);
//////            if (p == photos.length - 1) {
//////              onUploaded(upload);
//////            }
//////          });
//////          return;
//////        }
//////
//////        final upPhoto = createPhotoModel(
//////            urlPath: up.fileUrl,
//////            thumbnail: "",
//////            isLocal: false,
//////            objectId: up.documentId);
//////        upload.add(upPhoto);
//////        if (p == photos.length - 1) {
//////          onUploaded(upload);
//////        }
//////      });
//////    } else {
//////      upload.add(photo);
//////      if (p == photos.length - 1) {
//////        onUploaded(upload);
//////      }
//////    }
//////  }
//////}
////
////clearRecords() {
////  isAdmin = false;
////  isLoggedIn = false;
////  userModel = BaseModel();
////  appSettingsModel = BaseModel();
////  FirebaseAuth.instance.signOut();
////  usersStream?.cancel();
////  appSettingsStream?.cancel();
////  chatMessageController?.close();
////
////  myFollowers.clear();
////  amFollowing.clear();
////  myPosts.clear();
////  otherPosts.clear();
////
////  allMessages.clear();
////  myNotes.clear();
////  myNotifications.clear();
////  allPosts.clear();
////
////  otherPeronInfo.clear();
////  unreadCounter.clear();
////  lastMessages.clear();
////  showNewMessageDot.clear();
////  stopListening.clear();
////
////  chatSetup = false;
////  hasChatLoaded = false;
////  notesLoaded = false;
////  notifyLoaded = false;
////  postsLoaded = false;
////
////  hasSetup = false;
////}
////
////createBasicListeners({bool suspend = false, setUpMethods, redirectBack}) async {
////  FirebaseUser user = await FirebaseAuth.instance.currentUser();
////  //SharedPreferences pref = await SharedPreferences.getInstance();
////
////  if (suspend) {
////    clearRecords();
////    redirectBack();
////    return;
////  }
////
////  if (user != null) {
////    usersStream = Firestore.instance
////        .collection(AppDataBase.userBase)
////        .document(user.uid)
////        .snapshots()
////        .listen((shot) {
////      if (!shot.exists) {
////        clearRecords();
////        redirectBack();
////        return;
////      }
////
////      userModel = BaseModel(doc: shot);
////      isAdmin = userModel.isMaugost || userModel.isAdmin;
////      print("requesting ===> setUpMethods()");
////      if (null != setUpMethods) setUpMethods();
////    });
////  }
////
////  appSettingsStream = Firestore.instance
////      .collection(AppDataBase.appSettingsBase)
////      .document(AppDataBase.appSettings)
////      .snapshots()
////      .listen((shot) {
////    if (!shot.exists) {
////      appSettingsModel.saveItem(APP_SETTINGS_BASE, false,
////          document: APP_SETTINGS);
////      return;
////    }
////    if (shot != null) {
////      appSettingsModel = BaseModel(doc: shot);
////    }
////  });
////}
////
////placeHolder(double height,
////    {double width = 200, Color color = blue0, double opacity = .1}) {
////  return new Container(
////    height: height,
////    width: width,
////    color: color.withOpacity(opacity),
////    child: Center(
////        child: Opacity(
////            opacity: .3,
////            child: Image.asset(
////              AppConfig.appIcon,
////              width: 20,
////              height: 20,
////            ))),
////  );
////}
////
////Future<bool> isConnected() async {
////  var result = await (Connectivity().checkConnectivity());
////  if (result == ConnectivityResult.none) {
////    return Future<bool>.value(false);
////  }
////  return Future<bool>.value(true);
////}
////
//////getMultiCroppedImage(BuildContext context,
//////    {@required onPicked(List<BaseModel> path),
//////    int max = 2,
//////    bool withVideo = false,
//////    String topTitle}) async {
//////  PhotoPicker.openPicker(
//////    mediaType: withVideo ? "any" : 'image', // image | video | any
//////    multiple: true,
//////    limit: max,
//////  ).then((value) {
//////    if (null == value) return;
//////
//////    List<BaseModel> path = value.map((e) {
//////      print(e.toJson());
//////
//////      return createPhotoModel(
//////        urlPath: e.url.replaceAll("file://", ""),
//////        isVideo: e.type == "video",
//////        thumbnail: e.thumbnailUrl.replaceAll("file://", ""),
//////      );
//////    }).toList();
//////    onPicked(path);
//////  }).catchError((e) {
//////    logError(e.code, e.message);
//////  });
//////}
//////
//////String formatDOB(int v) {
//////  if (v < 10) return "0$v";
//////  return "$v";
//////}
////
//////List<String> getSearchString(String text) {
//////  text = text.toLowerCase().trim();
//////  if (text.isEmpty) return List();
//////
//////  List<String> list = List();
//////  list.add(text);
//////  var parts = text.split(" ");
//////  for (String s in parts) {
//////    if (s.isNotEmpty) list.add(s);
//////    for (int i = 0; i < s.length; i++) {
//////      String sub = s.substring(0, i);
//////      if (sub.isNotEmpty) list.add(sub);
//////    }
//////  }
//////  for (int i = 0; i < text.length; i++) {
//////    String sub = text.substring(0, i);
//////    if (sub.isNotEmpty) list.add(sub.trim());
//////  }
//////  return list;
//////}
//////
//////String translate(BuildContext context, String key) {
//////  return AppTranslations.of(context).text(key);
//////}
////
////adjustNumberSize(String price) {
////  if (price.contains("000000")) {
////    price = price.replaceAll("000000", "");
////    price = "${price}M";
////  } else if (price.length > 6) {
////    double pr = (int.parse(price)) / 1000000;
////    return "${pr.toStringAsFixed(1)}M";
////  } else if (price.contains("000")) {
////    price = price.replaceAll("000", "");
////    price = "${price}K";
////  } else if (price.length > 3) {
////    double pr = (int.parse(price)) / 1000;
////    return "${pr.toStringAsFixed(1)}K";
////  }
////
////  return price;
////}
////
////String getTimeAgo(int milli) {
////  return timeAgo.format(DateTime.fromMillisecondsSinceEpoch(milli),
////      locale: appLocale.languageCode);
////}
////
////openLink(String url) async {
////  if (await canLaunch(url)) {
////    await launch(
////      url,
////      //forceSafariVC: false,
////      //forceWebView: false,enableJavaScript: true
////    );
////  } else {
////    print('Could not launch $url');
////  }
////}
////
////enum TimeOfTheDay { inBed, morning, afternoon, evening, night }
////
////TimeOfTheDay get timeOfDayText {
//////  var now = Instant.now();
////  TimeOfDay time = TimeOfDay.fromDateTime(now.toDateTimeLocal());
////
//////  if (time.period == DayPeriod.am && (time.hour >= 0 && time.hour <= 4)) {
//////    return TimeOfTheDay.inBed;
//////  }
////
////  if (time.period == DayPeriod.am && (time.hour > 5 && time.hour <= 11)) {
////    return TimeOfTheDay.morning;
////  }
////
//////  if (time.period == DayPeriod.pm && (time.hour >= 12 && time.hour <= 15)) {
//////    return TimeOfTheDay.afternoon;
//////  }
////
////  if (time.period == DayPeriod.pm && (time.hour >= 12 && time.hour <= 19)) {
////    return TimeOfTheDay.evening;
////  }
////  return TimeOfTheDay.night;
////}
////
////void yesNoDialog(context, title, message, clickedYes) {
////  Navigator.push(
////      context,
////      PageRouteBuilder(
////          transitionsBuilder: transition,
////          opaque: false,
////          pageBuilder: (context, _, __) {
////            return messageDialog(
////              Icons.warning,
////              red0,
////              title,
////              message,
////              "Yes",
////              noText: "No, Cancel",
////            );
////          })).then((_) {
////    if (_ != null) {
////      if (_ == true) {
////        clickedYes();
////      }
////    }
////  });
////}
////
////getOtherPersonId(List parties) {
////  if (parties == null) return "";
//////  List parties = items[AppAssets.parties];
////  parties.remove(userModel.userId);
////  if (parties.isEmpty) return "";
////  return parties[0];
////}
////
////clickChat(context, BaseModel theUser) {
////  String chatId = createChatId(theUser.userId);
////  Map<String, dynamic> chatMap = {};
////  chatMap[PARTIES] = [userModel.userId, theUser.userId];
////  Firestore.instance
////      .collection(AppDataBase.chat_ids_base)
////      .document(chatId)
////      .setData(chatMap);
////
////  userModel
////    ..putInList(DELETED_CHATS, chatId, false)
////    ..updateItems();
////  pushAndResult(
////      context,
////      ChatMain(
////        chatId,
////        otherPerson: theUser,
////      ));
////}
////
////String getLastSeen(BaseModel user) {
////  int time = user.getInt(TIME_ONLINE) ?? 0;
////  int now = DateTime.now().millisecondsSinceEpoch;
////  int diff = now - time;
//////  if (diff > (Duration.millisecondsPerDay * 77)) return null;
////  return diff > (Duration.millisecondsPerDay * 30)
////      ? "Last seen: some weeks ago"
////      : "Last seen: ${timeAgo.format(DateTime.fromMillisecondsSinceEpoch(time), locale: "en")}";
////}
////
////bool isSameDay(int time1, int time2) {
////  DateTime date1 = DateTime.fromMillisecondsSinceEpoch(time1);
////
////  DateTime date2 = DateTime.fromMillisecondsSinceEpoch(time2);
////
////  return (date1.day == date2.day) &&
////      (date1.month == date2.month) &&
////      (date1.year == date2.year);
////}
////
////bool chatRemoved(BaseModel chat) {
////  if (chat.deleted) {
////    return true;
////  }
////  if (chat.hidden.contains(userModel.userId)) {
////    return true;
////  }
////  return false;
////}
////
////String createChatId(String hisId) {
////  String myId = userModel.userId;
////  List ids = [];
////  for (int i = 0; i < myId.length; i++) {
////    ids.add(myId[i]);
////  }
////  for (int i = 0; i < hisId.length; i++) {
////    ids.add(hisId[i]);
////  }
////  ids.sort((a, b) => a.compareTo(b));
////  StringBuffer sb = StringBuffer();
////  for (String s in ids) {
////    sb.write(s);
////  }
////  return sb.toString().trim();
////}
////
////String getChatDate(int milli) {
////  final formatter = DateFormat("MMM d 'AT' h:mm a");
////  DateTime date = DateTime.fromMillisecondsSinceEpoch(milli);
////  return formatter.format(date);
////}
////
////String getChatTime(int milli) {
////  final formatter = DateFormat("h:mm a");
////  DateTime date = DateTime.fromMillisecondsSinceEpoch(milli);
////  return formatter.format(date);
////}
////
////incomingChatText(context, BaseModel chat) {
////  if (chat.deleted) {
////    return incomingChatDeleted(context, chat);
////  }
////  if (chat.hidden.contains(userModel.userId)) {
////    return Container();
////  }
////
////  String message = chat.message;
////
////  return new GestureDetector(
////    onLongPress: () {
////      showChatOptions(context, chat);
////    },
////    child: new Container(
////      margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
////      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
////      decoration: BoxDecoration(
////          color: AppConfig.appColor, borderRadius: BorderRadius.circular(25)),
////      child: Column(
////        mainAxisSize: MainAxisSize.min,
////        crossAxisAlignment: CrossAxisAlignment.start,
////        children: <Widget>[
////          Text(
////            message,
////            style: textStyle(false, 17, white),
////          ),
////          /* addSpace(3),
////          Text(
////            getChatTime(chat.createdAt),
////            style: textStyle(false, 12, black.withOpacity(.3)),
////          ),*/
////        ],
////      ),
////    ),
////  );
////}
////
////incomingChatDeleted(context, BaseModel chat) {
////  if (chat.hidden.contains(userModel.userId)) {
////    return Container();
////  }
////  return GestureDetector(
////    onLongPress: () {
////      showChatOptions(context, chat, deletedChat: true);
////    },
////    child: new Container(
////      margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
////      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
////      decoration: BoxDecoration(
////          color: AppConfig.appColor, borderRadius: BorderRadius.circular(25)),
////      child: Column(
////        mainAxisSize: MainAxisSize.min,
////        crossAxisAlignment: CrossAxisAlignment.start,
////        children: <Widget>[
////          Row(
////            mainAxisSize: MainAxisSize.min,
////            crossAxisAlignment: CrossAxisAlignment.center,
////            children: <Widget>[
////              Text(
////                "Deleted",
////                style: textStyle(false, 17, white),
////              ),
////              addSpaceWidth(5),
////              Icon(
////                Icons.info,
////                color: white,
////                size: 17,
////              )
////            ],
////          ),
////          /*addSpace(3),
////          Text(
////            getChatTime(chat.createdAt),
////            style: textStyle(false, 12, black.withOpacity(.3)),
////          ),*/
////        ],
////      ),
////    ),
////  );
////}
////
////outgoingChatText(context, BaseModel chat) {
////  if (chat.deleted) {
////    return Container();
////  }
////  String message = chat.message;
////
////  String chatId = chat.chatId;
////  chatId = getOtherPersonId(chat.parties);
////  bool read = chat.readBy.contains(chatId);
////
////  return new GestureDetector(
////    onLongPress: () {
////      showChatOptions(context, chat);
////    },
////    child: new Container(
////      margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
////      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
////      decoration: BoxDecoration(
////          color: AppConfig.appColor.withOpacity(.7),
////          borderRadius: BorderRadius.circular(25)),
////      child: Column(
////        mainAxisSize: MainAxisSize.min,
////        crossAxisAlignment: CrossAxisAlignment.end,
////        children: <Widget>[
////          Text(
////            message,
////            style: textStyle(false, 20, white),
////          ),
////          /*addSpace(3),
////          Text(
////            getChatTime(chat.createdAt),
////            style: textStyle(false, 10, white.withOpacity(.3)),
////          ),*/
////        ],
////      ),
////    ),
////  );
////}
////
////incomingChatImage(context, BaseModel chat) {
////  if (chat.deleted) {
////    return incomingChatDeleted(context, chat);
////  }
////  if (chat.hidden.contains(userModel.userId)) {
////    return Container();
////  }
////  //List images = chat.getList(IMAGES);
////  String firstImage = chat.urlPath;
////
////  return new GestureDetector(
////    onLongPress: () {
////      //long pressed chat...
////      showChatOptions(context, chat);
////    },
////    onTap: () {
////      if (firstImage.isEmpty) return;
////      pushAndResult(context, ViewImage([firstImage], 0));
////    },
////    child: Container(
////      width: 290,
////      height: 200,
////      child: new Card(
////        color: default_white,
////        clipBehavior: Clip.antiAlias,
////        margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
////        elevation: 0,
////        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
////        child: Stack(
////          fit: StackFit.expand,
////          children: <Widget>[
////            CachedNetworkImage(
////                imageUrl: firstImage,
////                //width: 200,
////                height: 200,
////                fit: BoxFit.cover,
////                placeholder: (c, p) {
////                  return placeHolder(200, width: double.infinity);
////                }),
////            Align(
////              alignment: Alignment.bottomCenter,
////              child: gradientLine(height: 40),
////            ),
////            Align(
////                alignment: Alignment.bottomLeft,
////                child: Padding(
////                  padding: const EdgeInsets.all(8.0),
////                  child: Text(
////                    getChatTime(chat.createdAt),
////                    style: textStyle(false, 12, white.withOpacity(.3)),
////                  ),
////                )),
////          ],
////        ),
////      ),
////    ),
////  );
////}
////
////outgoingChatImage(context, BaseModel chat,
////    {@required setState, @required onSaved}) {
////  if (chat.deleted) {
////    return Container();
////  }
////  String urlPath = chat.urlPath ?? "";
////  bool isLocal = chat.isLocal;
////  bool uploading = upOrDown.contains(chat.getObjectId());
////  String chatId = chat.chatId;
////  chatId = getOtherPersonId(chat.parties);
////  bool read = chat.readBy.contains(chatId);
////
////  return new GestureDetector(
////    onLongPress: () {
////      //long pressed chat...
////      showChatOptions(context, chat);
////    },
////    onTap: () {
////      if (urlPath.isEmpty) return;
////      pushAndResult(context, ViewImage([urlPath], 0));
////    },
////    child: Container(
////      width: 290,
////      height: 200,
////      child: new Card(
////        color: AppConfig.appColor.withOpacity(.7),
////        clipBehavior: Clip.antiAlias,
////        margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
////        elevation: 0,
////        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
////        child: Stack(
////          fit: StackFit.expand,
////          children: <Widget>[
////            isLocal
////                ? Image.file(
////                    File(urlPath),
////                    fit: BoxFit.cover,
////                  )
////                : CachedNetworkImage(
////                    imageUrl: urlPath,
////                    fit: BoxFit.cover,
////                    placeholder: (c, p) {
////                      return placeHolder(200, width: double.infinity);
////                    }),
////            Align(
////              alignment: Alignment.bottomCenter,
////              child: gradientLine(height: 40),
////            ),
////            Align(
////                alignment: Alignment.bottomRight,
////                child: Padding(
////                  padding: const EdgeInsets.all(8.0),
////                  child: Text(
////                    getChatTime(chat.createdAt),
////                    style: textStyle(false, 12, white.withOpacity(.3)),
////                  ),
////                )),
////            urlPath.isNotEmpty
////                ? Container()
////                : Align(
////                    alignment: Alignment.center,
////                    child: GestureDetector(
////                      onTap: () {
////                        if (!uploading) {
////                          saveChatImage(chat,
////                              setState: setState, onSaved: onSaved);
////                        }
////                      },
////                      child: Container(
////                        width: 40,
////                        height: 40,
////                        decoration: BoxDecoration(
////                            color: black.withOpacity(.9),
////                            border: Border.all(color: white, width: 1),
////                            shape: BoxShape.circle),
////                        child: uploading
////                            ? Container(
////                                margin: EdgeInsets.all(5),
////                                child: CircularProgressIndicator(
////                                  //value: 20,
////                                  valueColor:
////                                      AlwaysStoppedAnimation<Color>(white),
////                                  strokeWidth: 2,
////                                ),
////                              )
////                            : Center(
////                                child: Icon(
////                                  Icons.arrow_upward,
////                                  color: white,
////                                  size: 20,
////                                ),
////                              ),
////                      ),
////                    ),
////                  )
////          ],
////        ),
////      ),
////    ),
////  );
////}
////
////saveChatImage(BaseModel chat, {@required setState, @required onSaved}) {
////  upOrDown.add(chat.getObjectId());
////  setState();
////  uploadFile(File(chat.urlPath), (url, error) {
////    upOrDown.removeWhere((s) => s == chat.getObjectId());
////    if (error != null) {
////      setState();
////      return;
////    }
////    chat
////      ..put(IS_LOCAL, false)
////      ..put(URL_PATH, url.fileUrl)
////      ..updateItems();
////    print("Saved $url");
////    onSaved();
////    setState();
////  });
////}
////
////incomingChatVideo(context, BaseModel chat) {
////  if (chat.deleted) {
////    return incomingChatDeleted(context, chat);
////  }
////  if (chat.hidden.contains(userModel.userId)) {
////    return Container();
////  }
////
////  String videoUrl = chat.urlPath;
////  String thumb = chat.thumbnailPath;
////  String videoLength = chat.videoLength;
////
////  return new Stack(
////    children: <Widget>[
////      Opacity(
////        opacity: videoUrl.isEmpty ? (.4) : 1,
////        child: new GestureDetector(
////          onLongPress: () {
////            showChatOptions(context, chat);
////            //long pressed chat...
////          },
////          child: Container(
////            width: 290,
////            child: new Card(
////              color: default_white,
////              clipBehavior: Clip.antiAlias,
////              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
////              elevation: 0,
////              shape: RoundedRectangleBorder(
////                  borderRadius: BorderRadius.circular(25)),
////              child: Column(
////                mainAxisSize: MainAxisSize.min,
////                crossAxisAlignment: CrossAxisAlignment.start,
////                children: <Widget>[
////                  new Container(
////                      color: blue0.withOpacity(.1),
////                      width: 250,
////                      height: 150,
////                      child: new GestureDetector(
////                          onTap: () {
////                            if (videoUrl.isEmpty) return;
////
////                            pushAndResult(context,
////                                PlayVideo(chat.getObjectId(), videoUrl));
////                          },
////                          child: new Stack(
////                            children: <Widget>[
////                              thumb.isEmpty
////                                  ? Container()
////                                  : CachedNetworkImage(
////                                      imageUrl: thumb,
////                                      fit: BoxFit.cover,
////                                      width: double.infinity,
////                                      height: 250,
////                                    ),
////                              Center(
////                                child: new Container(
////                                  width: 40,
////                                  height: 40,
////                                  decoration: BoxDecoration(
////                                      color: black.withOpacity(.9),
////                                      border:
////                                          Border.all(color: white, width: 1),
////                                      shape: BoxShape.circle),
////                                  child: videoUrl.isNotEmpty
////                                      ? Center(
////                                          child: Icon(
////                                            Icons.play_arrow,
////                                            color: white,
////                                            size: 20,
////                                          ),
////                                        )
////                                      : Container(),
////                                ),
////                              ),
////                              new Column(
////                                crossAxisAlignment: CrossAxisAlignment.end,
////                                children: <Widget>[
////                                  Expanded(flex: 1, child: Container()),
////                                  Row(
////                                    crossAxisAlignment: CrossAxisAlignment.end,
////                                    children: <Widget>[
////                                      Padding(
////                                        padding: const EdgeInsets.fromLTRB(
////                                            8, 0, 0, 8),
////                                        child: Text(
////                                          getChatTime(chat.createdAt),
////                                          style: textStyle(
////                                              false, 12, white.withOpacity(.3)),
////                                        ),
////                                      ),
////                                      Flexible(flex: 1, child: Container()),
////                                      Container(
////                                        margin: EdgeInsets.all(10),
////                                        decoration: BoxDecoration(
////                                            color: black.withOpacity(.9),
////                                            borderRadius:
////                                                BorderRadius.circular(10)),
////                                        child: Padding(
////                                          padding: const EdgeInsets.fromLTRB(
////                                              8, 4, 8, 4),
////                                          child: Text(videoLength,
////                                              style:
////                                                  textStyle(false, 12, white)),
////                                        ),
////                                      ),
////                                    ],
////                                  ),
////                                ],
////                              )
////                            ],
////                          ))),
////                  /* addSpace(3),
////                  Padding(
////                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
////                    child: Text(
////                      getChatTime(chat.createdAt),
////                      style: textStyle(false, 12, black.withOpacity(.3)),
////                    ),
////                  ),*/
////                ],
////              ),
////            ),
////          ),
////        ),
////      ),
////    ],
////  );
////}
////
////outgoingChatVideo(context, BaseModel chat,
////    {@required setState, @required onSaved}) {
////  if (chat.deleted) {
////    return Container();
////  }
////  String videoUrl = chat.urlPath;
////  String thumb = chat.thumbnailPath;
////  String videoLength = chat.videoLength;
////  bool uploading = upOrDown.contains(chat.getObjectId());
////  bool isLocal = chat.isLocal;
////
////  String chatId = chat.chatId;
////  chatId = getOtherPersonId(chat.parties.toList());
////  bool read = chat.readBy.contains(chatId);
////
////  return new GestureDetector(
////    onLongPress: () {
////      showChatOptions(context, chat);
////      //long pressed chat...
////    },
////    child: Container(
////      width: 290,
////      child: new Card(
////        color: AppConfig.appColor,
////        clipBehavior: Clip.antiAlias,
////        margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
////        elevation: 0,
////        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
////        child: Column(
////          mainAxisSize: MainAxisSize.min,
////          crossAxisAlignment: CrossAxisAlignment.end,
////          children: <Widget>[
////            new Container(
////                color: blue0.withOpacity(.1),
////                width: 250,
////                height: 150,
////                child: new GestureDetector(
////                    onTap: () {
////                      if (!isLocal) {
////                        pushAndResult(
////                            context,
////                            PlayVideo(
////                              chat.getObjectId(),
////                              videoUrl,
////                              videoFile: File(videoUrl),
////                            ));
////                      } else {
////                        if (!uploading) {
////                          saveChatVideo(chat,
////                              setState: setState, onSaved: onSaved);
////                          setState();
////                        }
////                      }
////                    },
////                    child: new Stack(
////                      fit: StackFit.expand,
////                      children: <Widget>[
////                        isLocal
////                            ? Image.file(
////                                File(thumb),
////                                fit: BoxFit.cover,
////                              )
////                            : CachedNetworkImage(
////                                imageUrl: thumb,
////                                fit: BoxFit.cover,
////                                placeholder: (c, p) {
////                                  return placeHolder(250,
////                                      width: double.infinity);
////                                }),
////                        Center(
////                          child: new Container(
////                            width: 40,
////                            height: 40,
////                            decoration: BoxDecoration(
////                                color: black.withOpacity(.9),
////                                border: Border.all(color: white, width: 1),
////                                shape: BoxShape.circle),
////                            child: videoUrl.isNotEmpty
////                                ? Center(
////                                    child: Icon(
////                                      Icons.play_arrow,
////                                      color: white,
////                                      size: 20,
////                                    ),
////                                  )
////                                : (!uploading)
////                                    ? Center(
////                                        child: Icon(
////                                          Icons.arrow_upward,
////                                          color: white,
////                                          size: 20,
////                                        ),
////                                      )
////                                    : Container(
////                                        margin: EdgeInsets.all(5),
////                                        child: CircularProgressIndicator(
////                                          //value: 20,
////                                          valueColor:
////                                              AlwaysStoppedAnimation<Color>(
////                                                  white),
////                                          strokeWidth: 2,
////                                        ),
////                                      ),
////                          ),
////                        ),
////                        new Column(
////                          crossAxisAlignment: CrossAxisAlignment.end,
////                          children: <Widget>[
////                            Expanded(flex: 1, child: Container()),
////                            Row(
////                              crossAxisAlignment: CrossAxisAlignment.end,
////                              children: <Widget>[
////                                Container(
////                                  margin: EdgeInsets.all(10),
////                                  decoration: BoxDecoration(
////                                      color: black.withOpacity(.9),
////                                      borderRadius: BorderRadius.circular(10)),
////                                  child: Padding(
////                                    padding:
////                                        const EdgeInsets.fromLTRB(8, 4, 8, 4),
////                                    child: Text(videoLength,
////                                        style: textStyle(false, 12, white)),
////                                  ),
////                                ),
////                                Flexible(flex: 1, child: Container()),
////                                /*Padding(
////                                  padding:
////                                  const EdgeInsets.fromLTRB(0, 0, 8, 8),
////                                  child: Text(
////                                    getChatTime(chat.createdAt),
////                                    style: textStyle(
////                                        false, 12, white.withOpacity(.3)),
////                                  ),
////                                ),*/
////                              ],
////                            ),
////                          ],
////                        )
////                      ],
////                    ))),
////            //addSpace(3),
////          ],
////        ),
////      ),
////    ),
////  );
////}
////
////saveChatVideo(BaseModel chat, {@required setState, @required onSaved}) {
////  String thumbnailPath = chat.thumbnailPath;
////  String urlPath = chat.urlPath;
////  bool isLocal = chat.isLocal;
////
////  if (!isLocal) {
////    onSaved();
////    return;
////  }
////
////  upOrDown.add(chat.getObjectId());
////
////  uploadFile(File(urlPath), (videoRes, error) {
////    upOrDown.removeWhere((s) => s == chat.getObjectId());
////    if (error != null) {
////      setState();
////      return;
////    }
////    //Upload the video thumbnail after saving the video itself.....
////    uploadFile(File(thumbnailPath), (thumbRes, error) {
////      upOrDown.removeWhere((s) => s == chat.getObjectId());
////      if (error != null) {
////        setState();
////        return;
////      }
////      chat
////        ..put(THUMBNAIL_PATH, thumbRes.fileUrl)
////        ..put(IS_LOCAL, false)
////        ..put(URL_PATH, videoRes.fileUrl)
////        ..updateItems();
////      saveChatVideo(chat, setState: setState, onSaved: onSaved);
////    });
////  });
////}
////
////userImageItem(context, String imageUrl) {
////  return new GestureDetector(
////    onTap: () {
//////      pushAndResult(context, MyProfile1(model,));
////    },
////    child: new Container(
////      decoration: BoxDecoration(
////        color: blue0,
////        border: Border.all(width: 2, color: white),
////        shape: BoxShape.circle,
////      ),
////      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
////      width: 40,
////      height: 40,
////      child: Stack(
////        children: <Widget>[
////          Card(
////            margin: EdgeInsets.all(0),
////            shape: CircleBorder(),
////            clipBehavior: Clip.antiAlias,
////            color: Colors.transparent,
////            elevation: .5,
////            child: Stack(
////              children: <Widget>[
////                Container(
////                  width: 40,
////                  height: 40,
////                  color: blue0,
////                  child: Center(
////                      child: Icon(
////                    Icons.person,
////                    color: white,
////                    size: 15,
////                  )),
////                ),
////                CachedNetworkImage(
////                  width: 40,
////                  height: 40,
////                  imageUrl: imageUrl,
////                  fit: BoxFit.cover,
////                ),
////              ],
////            ),
////          ),
////        ],
////      ),
////    ),
////  );
////}
////
////showChatOptions(context, BaseModel chat, {bool deletedChat = false}) {
////  int type = chat.type;
////  pushAndResult(
////    context,
////    listDialog(
////      type == CHAT_TYPE_TEXT && !deletedChat ? ["Copy", "Delete"] : ["Delete"],
////      usePosition: false,
////    ),
////    result: (_) {
////      if (_ == "Copy") {
////        //ClipboardManager.copyToClipBoard(chat.getString(MESSAGE));
////      }
////      if (_ == "Delete") {
////        if (chat.myItem()) {
////          chat
////            ..put(DELETED, true)
////            ..updateItems();
////        } else {
////          chat
////            ..putInList(HIDDEN, userModel.userId, true)
////            ..updateItems();
////        }
////      }
////    },
////  );
////}
////
////class ViewImage extends StatefulWidget {
////  List images;
////  int position;
////  ViewImage(
////    this.images,
////    this.position,
////  );
////  @override
////  _ViewImageState createState() => _ViewImageState();
////}
////
////class _ViewImageState extends State<ViewImage> {
////  List images;
////  int position;
////
////  @override
////  void initState() {
////    // TODO: implement initState
////    images = widget.images;
////    position = widget.position;
////    super.initState();
////  }
////
////  @override
////  Widget build(BuildContext context) {
////    PageController controller = PageController(initialPage: position);
////    List<PhotoViewGalleryPageOptions> list = List();
////    for (String image in images) {
////      list.add(PhotoViewGalleryPageOptions(
////        imageProvider:
////            (image.startsWith("https://") || image.startsWith("http://"))
////                ? NetworkImage(image)
////                : FileImage(File(image)),
////        initialScale: PhotoViewComputedScale.contained,
////        /* maxScale: PhotoViewComputedScale.contained * 0.3*/
////      ));
////    }
////    // TODO: implement build
////    return Container(
////      color: black,
////      child: Stack(children: <Widget>[
////        PhotoViewGallery(
////          pageController: controller,
////          pageOptions: list,
////          onPageChanged: (p) {
////            position = p;
////            setState(() {});
////          },
////        ),
////        new Container(
////          margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
////          width: 50,
////          height: 50,
////          child: FlatButton(
////            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
////            onPressed: () {
////              Navigator.pop(context);
////            },
////            child: Center(
////                child: Icon(
////              Icons.keyboard_backspace,
////              color: white,
////              size: 25,
////            )),
////          ),
////        ),
////        Column(
////          mainAxisSize: MainAxisSize.max,
////          children: <Widget>[
////            Expanded(flex: 1, child: Container()),
////            new Padding(
////              padding: const EdgeInsets.all(20),
////              child: tabIndicator(images.length, position),
////            ),
////          ],
////        )
////      ]),
////    );
////  }
////}
////
////gradientLine(
////    {double height = 4, bool reverse = false, alpha = .3, color: black}) {
////  return Container(
////    width: double.infinity,
////    height: height,
////    decoration: BoxDecoration(
////        gradient: LinearGradient(
////            begin: FractionalOffset.topCenter,
////            end: FractionalOffset.bottomCenter,
////            colors: reverse
////                ? [
////                    color.withOpacity(alpha),
////                    transparent,
////                  ]
////                : [transparent, color.withOpacity(alpha)])),
////  );
////}
////
////tabIndicator(int tabCount, int currentPosition, {margin}) {
////  return Container(
////    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
////    margin: margin,
////    decoration: BoxDecoration(
////        color: black.withOpacity(.7), borderRadius: BorderRadius.circular(25)),
////    child: Row(
////      crossAxisAlignment: CrossAxisAlignment.center,
////      mainAxisSize: MainAxisSize.min,
////      children: getTabs(tabCount, currentPosition),
////    ),
////  );
////  /*return Marker(
////      markerId: MarkerId(""),
////      infoWindow: InfoWindow(),
////      icon: await BitmapDescriptor.fromAssetImage(ImageConfiguration(), ""));*/
////}
////
////getTabs(int count, int cp) {
////  List<Widget> items = List();
////  for (int i = 0; i < count; i++) {
////    bool selected = i == cp;
////    items.add(Container(
////      width: selected ? 10 : 8,
////      height: selected ? 10 : 8,
////      //margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
////      decoration: BoxDecoration(
////          color: white.withOpacity(selected ? 1 : (.5)),
////          shape: BoxShape.circle),
////    ));
////    if (i != count - 1) items.add(addSpaceWidth(5));
////  }
////
////  return items;
////}
////
////class PlayVideo extends StatefulWidget {
////  String id;
////  String link;
////  File videoFile;
////
////  PlayVideo(
////    this.id,
////    this.link, {
////    this.videoFile,
////  });
////  @override
////  _PlayVideoState createState() => _PlayVideoState();
////}
////
////class _PlayVideoState extends State<PlayVideo> {
////  File videoFile;
////  String id;
////  String videoLink;
////
////  @override
////  void initState() {
////    // TODO: implement initState
////    super.initState();
////    id = widget.id;
////    videoLink = widget.link;
////    videoFile = widget.videoFile;
////    if (videoFile == null) checkVideo();
////  }
////
////  @override
////  Widget build(BuildContext context) {
////    return new Container(
////        color: black,
////        child: Stack(children: [
////          videoLink == null && videoFile == null
////              ? Container()
////              : videoFile != null
////                  ? SimpleVideoPlayer(
////                      file: videoFile,
////                    )
////                  : SimpleVideoPlayer(
////                      source: videoLink,
////                    ),
////          new Container(
////            margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
////            width: 50,
////            height: 50,
////            child: FlatButton(
////              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
////              onPressed: () {
////                Navigator.pop(context);
////              },
////              child: Center(
////                  child: Icon(
////                Icons.keyboard_backspace,
////                color: white,
////                size: 25,
////              )),
////            ),
////          )
////        ]));
////  }
////
////  void checkVideo() async {
////    String videoFileName = "${widget.id}${widget.link.hashCode}.mp4";
////
////    File file = await getLocalFile(videoFileName);
////    bool exist = await file.exists();
////
////    if (!exist) {
////      downloadFile(file);
////      videoLink = widget.link;
////      setState(() {});
////      //createVideo(true, link: widget.link);
////    } else {
////      //createVideo(false, file: file);
////      videoFile = file;
////      setState(() {});
////    }
////  }
////
////  void downloadFile(File file) async {
////    //toastInAndroid("Downloading...");
////
////    QuerySnapshot shots = await Firestore.instance
////        .collection(AppDataBase.referenceBase)
////        .where(FILE_URL, isEqualTo: widget.link)
////        .limit(1)
////        .getDocuments();
////    if (shots.documents.isEmpty) {
////      //toastInAndroid("Link not found");
////    } else {
////      for (DocumentSnapshot doc in shots.documents) {
////        if (!doc.exists || doc.data.isEmpty) continue;
////        String ref = doc.data[REFERENCE];
////        StorageReference storageReference =
////            FirebaseStorage.instance.ref().child(ref);
////        storageReference.writeToFile(file).future.then((_) {
////          //toastInAndroid("Download Complete");
////        }, onError: (error) {
////          //toastInAndroid(error);
////        }).catchError((error) {
////          //toastInAndroid(error);
////        });
////
////        break;
////      }
////    }
////  }
////}
////
////int getDurationInSeconds(String length) {
////  var parts = length.split(":");
////  int ms = int.parse(parts[0]);
////  int ss = int.parse(parts[1]);
////  return (ms * 60) + ss;
////}
////
////Future<String> get localPath async {
////  final directory = await getApplicationDocumentsDirectory();
////
////  return directory.path;
////}
////
////Future<File> getLocalFile(String name) async {
////  final path = await localPath;
////  return File('$path/$name');
////}
////
////scrollTotallyUp(ScrollController scrollController) {
////  if (scrollController != null && !scrollController.position.outOfRange) {
////    scrollController.animateTo(scrollController.position.minScrollExtent,
////        duration: new Duration(milliseconds: 500), curve: Curves.linear);
////  }
////}
////
////scrollTotallyDown(ScrollController scrollController) {
////  if (scrollController != null && !scrollController.position.outOfRange) {
////    scrollController.animateTo(scrollController.position.maxScrollExtent,
////        duration: new Duration(milliseconds: 500), curve: Curves.linear);
////  }
////}
////
////addItemToList(
////    {@required T,
////    @required List thisList,
////    bool sort = true,
////    bool isNew = false,
////    onAdded(list)}) {
////  int p = thisList.indexWhere((e) => e.documentId == T.documentId);
////  bool exists = p != -1;
////  if (exists) {
////    thisList[p] = T;
////  } else {
////    if (isNew) {
////      thisList.insert(0, T);
////    } else {
////      thisList.add(T);
////    }
////  }
////  if (sort) thisList.sort((p1, p2) => p2.createdAt.compareTo(p1.createdAt));
////  onAdded(thisList);
////}
////
////postViewLayout({
////  @required BuildContext context,
////  @required BaseModel post,
////  BaseModel partner,
////  @required onUpdate(BaseModel post),
////  @required onDeleted,
////  //@required onSave,
////  bool canComment = true,
////  bool isInView,
////  bool showPartner = false,
////  bool showTranslated = false,
////  int position = 0,
////}) {
////  bool hasMedia = post.getPhotos.isNotEmpty;
////  String message = post.getString(MESSAGE);
////  String translated = post.getString(TRANSLATION);
////  bool isTranslated = (message != translated) && translated.isNotEmpty;
////  bool hasMessage = message.isNotEmpty;
////  //User thisUser = post.owner;
////  List<BaseModel> photos = post.getPhotos;
////  bool haveLiked = post.getList(LIKED_BY).contains(userModel.userId);
////  String time = getTimeAgo(post.getTime());
////  bool myPost = post.myItem();
////  bool following = userModel.amFollowing.contains(post.getUserId());
////
////  return Container(
////    margin: 5.padAll(),
////    padding: 10.padAll(),
////    decoration: BoxDecoration(
////        color: white,
////        borderRadius: BorderRadius.circular(5),
////        border: Border.all(color: black.withOpacity(.03))),
////    child: Column(
////      crossAxisAlignment: CrossAxisAlignment.start,
////      mainAxisSize: MainAxisSize.min,
////      children: <Widget>[
////        Row(
////          children: <Widget>[
////            Flexible(
////              child: InkWell(
////                onTap: () {
////                  if (post.myItem()) return;
////                  pushAndResult(
////                      context,
////                      ShowProfile(
////                        thisUser: post,
////                      ));
////                },
////                child: Row(
////                  children: <Widget>[
////                    imageHolder(50, post.userImage.urlPath),
////                    10.spaceWidth(),
////                    Column(
////                      crossAxisAlignment: CrossAxisAlignment.start,
////                      children: <Widget>[
////                        Text(
////                          post.fullName,
////                          style: textStyle(true, 14, black),
////                        ),
////                        3.spaceHeight(),
////                        Text(
////                          '@${post.nickName}',
////                          style: textStyle(false, 13, black.withOpacity(.7)),
////                        ),
////                      ],
////                    )
////                  ],
////                ),
////              ),
////            ),
////            15.spaceWidth(),
////            GestureDetector(
////              onTap: () {
////                String fName = "(${post.fullName})";
////                pushAndResult(
////                    context,
////                    listDialog(
////                      [
////                        if (myPost) ...[
////                          translate(context, LangKey.edit_post),
////                          translate(context, LangKey.delete_post),
////                        ] else ...[
////                          translate(context, LangKey.chat_user),
////                          translate(context, LangKey.share_post),
////                          if (following)
////                            translate(context, LangKey.unFollow_post) + fName
////                          else
////                            translate(context, LangKey.follow_post) + fName,
////                          translate(context, LangKey.report_abuse),
////                        ]
////                      ],
////                      usePosition: false,
////                    ), result: (_) {
////                  if (_ == translate(context, LangKey.edit_post)) {
////                    pushAndResult(
////                        context,
////                        CreatePost(
////                          post: post,
////                        ), result: (_) {
////                      if (_ == null) return;
////                      onUpdate(_);
////                    });
////                    return;
////                  }
////
////                  if (_ == translate(context, LangKey.delete_post)) {
////                    Firestore.instance
////                        .collection(AppDataBase.postBase)
////                        .document(post.getObjectId())
////                        .delete();
////                    onDeleted();
////                    return;
////                  }
////
////                  if (_ == translate(context, LangKey.chat_user)) {
////                    return;
////                  }
////
////                  if (_ == translate(context, LangKey.share_post)) {
////                    return;
////                  }
////
////                  if (_ == translate(context, LangKey.follow_post) + fName ||
////                      _ == translate(context, LangKey.unFollow_post) + fName) {
////                    followThisUser(post, following, onComplete: () {
////                      onUpdate(post);
////                    });
////
////                    return;
////                  }
////
////                  if (_ == translate(context, LangKey.report_abuse)) {
////                    reportThis(context, post, onDeleted: () {
////                      onDeleted();
////                    });
////                    return;
////                  }
////                });
////              },
////              child: Icon(
////                Icons.more_vert,
////                color: black.withOpacity(.3),
////              ),
////            )
////          ],
////        ),
////        if (hasMedia)
////          FeedImage(
////              thisPost: post,
////              isComment: !canComment,
////              onSave: onUpdate,
////              play: isInView,
////              position: position),
////        if (hasMessage) ...[
////          5.spaceHeight(),
////          RichText(
////            text: getHashTagTextSpan(textStyle(true, 16, AppConfig.appColor),
////                textStyle(false, 16, black), message, (s) {}),
////          ),
////          5.spaceHeight(),
////        ],
////        if (isTranslated) ...[
////          FlatButton(
////            onPressed: () {
////              post.put(SHOW_TRANSLATED, !showTranslated);
////              onUpdate(post);
////            },
////            color: transparent,
////            child: Text(
////              "${showTranslated ? "Hide" : "Show"} Translation",
////              style: textStyle(true, 12, AppConfig.appColor),
////            ),
////          ),
////          //5.spaceHeight(),
////          if (showTranslated) ...[
////            5.spaceHeight(),
////            RichText(
////              text: getHashTagTextSpan(textStyle(true, 16, AppConfig.appColor),
////                  textStyle(false, 16, black), translated, (s) {}),
////            ),
////          ]
////        ],
////        Container(
////          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
////          child: Column(
////            crossAxisAlignment: CrossAxisAlignment.start,
////            children: <Widget>[
////              //5.spaceHeight(),
////              Text(
////                time,
////                style: textStyle(false, 11, black.withOpacity(.5)),
////              ),
////              5.spaceHeight(),
////              Row(
////                mainAxisAlignment: MainAxisAlignment.spaceBetween,
////                children: <Widget>[
////                  Row(
////                    children: <Widget>[
////                      Row(
////                        children: <Widget>[
////                          GestureDetector(
////                            onTap: () {
////                              likeThisPost(post, haveLiked, onComplete: (p) {
////                                onUpdate(p);
////                              });
////                            },
////                            child: new Container(
////                              height: 40,
////                              width: 20,
////                              child: Center(
////                                  child: FlareActor(
////                                "assets/images/favorite.flr",
////                                shouldClip: false,
////                                color: haveLiked
////                                    ? AppConfig.appColor
////                                    : black.withOpacity(.6),
////                                animation:
////                                    haveLiked ? "Favorite" : "Unfavorite",
////                                //isPaused: !haveLiked,
////                              )),
////                            ),
////                          ),
////                          addSpaceWidth(5),
////                          Text(
////                            formatFeedCount(post.likedBy.length),
////                            style: textStyle(false, 14, black.withOpacity(.5)),
////                          ),
////                        ],
////                      ),
////                      if (canComment) ...[
////                        addSpaceWidth(15),
////                        GestureDetector(
////                          onTap: () {
////                            pushAndResult(
////                                context,
////                                ShowComments(
////                                  thisPost: post,
////                                ), result: (_) {
////                              if (null == _) return;
////                              onUpdate(_);
////                            });
////                          },
////                          child: Row(
////                            children: <Widget>[
////                              Icon(
////                                Feather.message_circle,
////                                color: black.withOpacity(.6),
////                                //size: 18,
////                              ),
////                              addSpaceWidth(5),
////                              Text(
////                                formatFeedCount(post.commentedBy.length),
////                                style:
////                                    textStyle(false, 14, black.withOpacity(.5)),
////                              ),
////                            ],
////                          ),
////                        ),
////                      ],
////                      addSpaceWidth(15),
////                      Icon(
////                        Feather.star,
////                        color: black.withOpacity(.6),
////                        //size: 18,
////                      ),
////                    ],
////                  ),
//////                  Row(
//////                    children: <Widget>[
//////                      Icon(
//////                        Feather.eye,
//////                        color: black.withOpacity(.6),
//////                        //size: 20,
//////                      ),
//////                      addSpaceWidth(4),
//////                      Text(
//////                        formatFeedCount(post.owner.followers.length),
//////                        style: textStyle(false, 14, black.withOpacity(.5)),
//////                      ),
//////                    ],
//////                  ),
////                ],
////              ),
////            ],
////          ),
////        )
////      ],
////    ),
////  );
////}
////
////formatFeedCount(int size) {
////  return size == 0 ? "" : adjustNumberSize(size.toString());
////}
////
////String formatAmount(String text) {
////  text = text.replaceAll(",", "");
////  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
////  Function mathFunc = (Match match) => '${match[1]},';
////
////  String newText = text.replaceAllMapped(reg, mathFunc);
////  return newText.startsWith("-")?"(${newText.replaceAll("-", "")})":newText;
////}
////
////getVideoThumbnail(String path) async {
////  return (await VideoCompress()
////          .getThumbnailWithFile(path, quality: 100, position: -1))
////      .path;
////}
////
////void logError(String code, String message) =>
////    print('Error: $code\nError Message: $message');
////
////followThisUser(BaseModel thisUser, bool following, {onComplete}) {
////  String notifyId = "${userModel.userId}${thisUser.userId}";
////
//////  print(following);
//////  print(thisUser.myItem());
//////  return;
////
////  thisUser..putInList(MY_FOLLOWER_IDS, userModel.userId, !following);
////  userModel..putInList(AM_FOLLOWING_IDS, thisUser.userId, !following);
////
////  if (following) {
////    Firestore.instance.collection(NOTIFY_BASE).document(notifyId).delete();
////  } else {
////    sendPushNotification(
////        title: "New Follower",
////        type: NOTIFY_TYPE_FOLLOW,
////        message: "${userModel.nickName} followed you",
////        notifiedId: notifyId,
////        parties: [thisUser.userId],
////        notifiedOnThis: userModel);
////  }
////  thisUser.updateItems();
////  userModel.updateItems();
////  onComplete();
////}
////
////likeThisPost(BaseModel thisPost, bool haveLiked,
////    {onComplete(BaseModel post), int type = NOTIFY_TYPE_POST}) {
////  String notifyId = "${userModel.getUserId()}${thisPost.getObjectId()}";
////  thisPost.putInList(LIKED_BY, userModel.getObjectId(), !haveLiked);
////  if (haveLiked) {
////    Firestore.instance.collection(NOTIFY_BASE).document(notifyId).delete();
////  } else {
////    sendPushNotification(
////        title: "${type == NOTIFY_TYPE_POST ? "Post" : "Comment"} Liked",
////        type: type,
////        message:
////            "${userModel.nickName} like your ${type == NOTIFY_TYPE_POST ? "post" : "comment"}",
////        notifiedId: notifyId,
////        parties: [thisPost.userId],
////        notifiedOnThis: thisPost);
////  }
////  thisPost.updateItems();
////  onComplete(thisPost);
////}
////
////reportThis(BuildContext context, BaseModel thisPost,
////    {onDeleted, int type = REPORT_TYPE_POST}) {
////  String typeString;
////  if (type == REPORT_TYPE_POST) typeString = "Post";
////  if (type == REPORT_TYPE_COMMENT) typeString = "Comment";
////  if (type == REPORT_TYPE_USER) typeString = "User";
////  if (type == REPORT_TYPE_STORY) typeString = "Story";
////
////  pushAndResult(
////      context,
////      inputDialog(
////        "Report $typeString",
////        hint: "Tell us why your reporting...?",
////      ), result: (_) {
////    if (_ == null) return;
////
////    BaseModel report = BaseModel();
////    report
////      ..put(MESSAGE, _)
////      ..put(TYPE, type)
////      ..put(REPORTED_ID, thisPost.getObjectId());
////    report.saveItem(REPORT_BASE, true);
////    userModel
////      ..putInList(MUTED, thisPost.getObjectId(), true)
////      ..updateItems();
////  });
////}
////
////String formatToK(int num) {
////  return NumberFormat.compactCurrency(decimalDigits: 0, symbol: "").format(num);
////}
////
////formatPrice(String price) {
////  if (price.contains("000000")) {
////    price = price.replaceAll("000000", "");
////    price = "${price}M";
////  } else if (price.length > 6) {
////    double pr = (int.parse(price)) / 1000000;
////    return "${pr.toStringAsFixed(1)}M";
////  } else if (price.contains("000")) {
////    price = price.replaceAll("000", "");
////    price = "${price}K";
////  } else if (price.length > 3) {
////    double pr = (int.parse(price)) / 1000;
////    return "${pr.toStringAsFixed(1)}K";
////  }
////  return price;
////}
////
////String formatDuration(Duration position) {
////  final ms = position.inMilliseconds;
////
////  int seconds = ms ~/ 1000;
////  final int hours = seconds ~/ 3600;
////  seconds = seconds % 3600;
////  var minutes = seconds ~/ 60;
////  seconds = seconds % 60;
////
////  final hoursString = hours >= 10 ? '$hours' : hours == 0 ? '00' : '0$hours';
////
////  final minutesString =
////      minutes >= 10 ? '$minutes' : minutes == 0 ? '00' : '0$minutes';
////
////  final secondsString =
////      seconds >= 10 ? '$seconds' : seconds == 0 ? '00' : '0$seconds';
////
////  final formattedTime =
////      '${hoursString == '00' ? '' : hoursString + ':'}$minutesString:$secondsString';
////
////  return formattedTime;
////}
////
////class RaisedGradientButton extends StatelessWidget {
////  final Widget child;
////  final Gradient gradient;
////  final double width;
////  final double height;
////  final Function onPressed;
////  final bool round;
////  final bool addShadow;
////
////  const RaisedGradientButton(
////      {Key key,
////      @required this.child,
////      this.gradient,
////      this.width = double.infinity,
////      this.height = 50.0,
////      this.onPressed,
////      this.addShadow = true,
////      this.round = true})
////      : super(key: key);
////
////  @override
////  Widget build(BuildContext context) {
////    return Container(
////      width: width,
////      height: height,
////      decoration: BoxDecoration(
////          gradient: gradient,
////          borderRadius: round ? null : BorderRadius.circular(25),
////          boxShadow: !addShadow
////              ? null
////              : [
////                  BoxShadow(
////                    color: Colors.grey[500],
////                    blurRadius: 1.5,
////                  ),
////                ],
////          shape: round ? BoxShape.circle : BoxShape.rectangle),
////      child: Material(
////        color: Colors.transparent,
////        child: FlatButton(
////            shape: round
////                ? CircleBorder()
////                : RoundedRectangleBorder(
////                    borderRadius: round ? null : BorderRadius.circular(25),
////                  ),
////            color: Colors.transparent,
////            onPressed: onPressed,
////            padding: EdgeInsets.all(0),
////            child: Center(
////              child: child,
////            )),
////      ),
////    );
////  }
//}
