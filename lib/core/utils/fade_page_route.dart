import 'package:flutter/cupertino.dart';

class FadePageRoute extends CupertinoPageRoute {
  final Widget? widget;

  FadePageRoute(this.widget)
      : super(
          builder: (BuildContext context) {
            return widget!;
          },
        );
}
