part of 'app.dart';

class progressDialog extends StatefulWidget {
  String id;
  String message;
  bool cancelable;
  double countDown;
  progressDialog(this.id,
      {this.message = "", this.cancelable = false, this.countDown = 0});
  @override
  _progressDialogState createState() => _progressDialogState();
}

class _progressDialogState extends State<progressDialog> {
  String id;
  String message;
  bool cancelable;
  double countDown;
  BuildContext context;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.id;
    message = widget.message ?? "";
    cancelable = widget.cancelable ?? false;
    countDown = widget.countDown ?? 0;
  }

  void hideHandler() {
    Future.delayed(Duration(milliseconds: 500), () {
      if (currentProgress == id) {
        Navigator.pop(context);
        return;
      }

//      setState(() {
//      });
      //message = currentProgressText;
      if (countDown > 0) {
        setState(() {
          countDown = countDown - 0.5;
        });
      }

      hideHandler();
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() => this.context = context);

    hideHandler();

    return GestureDetector(
      onTap: () {
        //if (cancelable)
        Navigator.pop(context);
      },
      child: WillPopScope(
        child: Stack(fit: StackFit.expand, children: <Widget>[
          Container(
            color: black.withOpacity(.7),
          ),
          page()
        ]),
        onWillPop: () async {
          if (cancelable) Navigator.pop(context);
          return false;
        },
      ),
    );
  }

  page() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          color: black.withOpacity(.8),
        ),
        Center(
            child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(color: white, shape: BoxShape.circle),
        )),
        Center(
          child: SizedBox(
            height: 120,
            width: 120,
            child: LoadingIndicator(
              indicatorType: Indicator.orbit,
              color: AppConfig.appColor,
            ),
          ),
        ),
        Center(
          child: Opacity(
            opacity: .3,
            child: Image.asset(
              AppConfig.appIcon,
              width: 20,
              height: 20,
            ),
          ),
        ),
        Center(
          child: CircularProgressIndicator(
            //value: 20,
            valueColor: AlwaysStoppedAnimation<Color>(white),
            strokeWidth: 2,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: new Container(),
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                countDown > 0
                    ? "$message (in ${countDown.toInt()} secs)"
                    : message,
//                style: textStyle(false, 15, white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
