import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utils {
  static String key_token = "key_token";
  static String CDN = "http://118.70.236.144:8824/api/v1.0/";
  static String GET_COURSE= CDN + "course";
  static String GET_COURSE_SEARCH = GET_COURSE + "/search";
  static String GET_COURSE_category = CDN + "/coursecategory";


  static void pushScreen(BuildContext context, Widget widget) {
    Navigator.of(context)
        .push(TransparentRoute(builder: (BuildContext context) => widget));
  }
  static Widget customText(
      {text = "",
        color = Colors.black,
        size = 16.0,
        fontWeight = FontWeight.normal,
        line = 3,
        textAlign = TextAlign.left}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          color: color,
          height: 1.4,
          fontWeight: fontWeight,
          decoration: TextDecoration.none),
      textAlign: textAlign,
      maxLines: line,
      overflow: TextOverflow.ellipsis,
    );
  }

  Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
    return rootBundle.loadString(assetsPath).then((value) => jsonDecode(value));
  }

  static bool equalsIgnoreCase(String string1, String string2) {
    return string1?.toLowerCase() == string2?.toLowerCase();
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
class TransparentRoute extends PageRoute<void> {
  TransparentRoute({
    @required this.builder,
    RouteSettings settings,
  })  : assert(builder != null),
        super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 350);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: result,
    );
  }
}
class LabeledCheckbox extends StatelessWidget {
  LabeledCheckbox({
    this.label,
    this.padding,
    this.color,
    this.value,
    this.onChanged,
    this.width,
    this.height,
  });
  final String label;
  final EdgeInsets padding;
  final Color color;
  final dynamic value;
  final Function onChanged;
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    if(width == null) width = 20.0;
    if(height == null) height = 20.0;
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor:
                color,
              ),
              child: Container(
                width: 20,
                height: 20,
                child: Checkbox(
                  activeColor: color,
                  value: value,
                  onChanged: (dynamic newValue) {
                    onChanged(newValue);
                  },
                ),
              ),
            ),
            Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Utils.customText(text:label),
                )),
          ],
        ),
      ),
    );
  }
}