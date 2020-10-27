import 'package:flutter/material.dart';
import 'package:football_explorer/app/theme/theme_notifier.dart';
import 'package:provider/provider.dart';

class SwitchTheme extends StatefulWidget {
  @override
  _SwitchThemeState createState() => _SwitchThemeState();
}

class _SwitchThemeState extends State<SwitchTheme>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, notifier, child) {
      return IconButton(
        // iconSize: 50,
        icon: Icon(notifier.isDarkTheme
            ? Icons.lightbulb
            : Icons.lightbulb_outline_rounded),
        onPressed: () {
          setState(() {
            notifier.toggleTheme();
          });
        },
      );
    });
  }
}
