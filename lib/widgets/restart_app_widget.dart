import 'package:flutter/cupertino.dart';

class RestartAppWidget extends StatefulWidget {
  final Widget child;
  const RestartAppWidget({super.key, required this.child});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartAppWidgetState>()?.restartApp();
  }

  @override
  State<RestartAppWidget> createState() => _RestartAppWidgetState();
}

class _RestartAppWidgetState extends State<RestartAppWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(key: key, child: widget.child);
  }
}
