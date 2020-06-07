part of 'app.dart';

extension ContextExt on BuildContext {
  screenWidth() => MediaQuery.of(this).size.width;
  screenHeight() => MediaQuery.of(this).size.height;

  screenWidthTimesBy(int s) => MediaQuery.of(this).size.width * s;
  screenHeightTimesBy(int s) => MediaQuery.of(this).size.height * s;

  screenHeightDivide(int s) => MediaQuery.of(this).size.height / s;
  screenWidthDivide(int s) => MediaQuery.of(this).size.width / s;

//  String trans(String key) => translate(this, key);
}

extension NumExtra on num {
  spaceWidth() => SizedBox(
        width: this.toDouble(),
      );
  spaceHeight() => SizedBox(
        height: this.toDouble(),
      );
  padAtLeft() => EdgeInsets.only(left: this.toDouble());
  padAtRight() => EdgeInsets.only(right: this.toDouble());
  padAtTop() => EdgeInsets.only(top: this.toDouble());
  padAtBottom() => EdgeInsets.only(bottom: this.toDouble());
  padAll() => EdgeInsets.all(this.toDouble());
  padAt({
    double l = 0.0,
    double r = 0.0,
    double t = 0.0,
    double b = 0.0,
  }) =>
      EdgeInsets.only(left: l, right: r, top: t, bottom: b);

  screenWidth(BuildContext c) => MediaQuery.of(c).size.width;
  screenHeight(BuildContext c) => MediaQuery.of(c).size.height;
  screenWidthTimesBy(BuildContext c) => MediaQuery.of(c).size.width * this;
  screenHeightTimesBy(BuildContext c) => MediaQuery.of(c).size.height * this;
  screenHeightDivide(BuildContext c) => MediaQuery.of(c).size.height / this;
  screenWidthDivide(BuildContext c) => MediaQuery.of(c).size.width / this;
}

extension StringExtra on String {
  int toInt() => num.parse(this).toInt();
}

extension ColorExtra on Colors {
  Color fromShotInt(int value) => Color(value);
}

double screenW(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenH(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

//extension Localization on String {
//  //
//  static var t = Translations("en_us") +
//      {
//        "en_us": "i18n Demo",
//        "pt_br": "Demonstração i18n",
//      };
//
//  String get i18n => localize(this, t);
//
//  String fill(List<Object> params) => localizeFill(this, params);
//
//  String plural(int value) => localizePlural(value, this, t);
//
//  String version(Object modifier) => localizeVersion(modifier, this, t);
//
//  Map<String, String> allVersions() => localizeAllVersions(this, t);
//}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}

extension ListExtra on List {
  List<BaseModel> addModel(BaseModel model,
      {bool sort = true, bool isNew = false}) {
    int p = this.indexWhere((e) => e.getObjectId() == model.getObjectId());
    bool exists = p != -1;
    if (exists) {
      this[p] = model;
    } else {
      if (isNew) {
        this.insert(0, model);
      } else {
        this.add(model);
      }
    }
    //myNotifications.sort((a, b) => b.time.compareTo(a.time));
    if (sort) this.sort((p1, p2) => p2.time.compareTo(p1.time));
    return this;
  }

  List addId(String id, {bool sort = true, bool isNew = false}) {
    int p = this.indexWhere((e) => e == id);
    bool exists = p != -1;
    if (exists) {
      this[p] = id;
    } else {
      this.add(id);
    }
    return this;
  }

  List<BaseModel> removeModel(
    String id,
  ) {
    this.removeWhere((e) => e.getObjectId() == id);
    return this;
  }
}
