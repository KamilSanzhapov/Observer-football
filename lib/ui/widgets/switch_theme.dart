import 'package:flutter/material.dart';

class SwitchTheme extends StatefulWidget {
  @override
  _SwitchThemeState createState() => _SwitchThemeState();
}

class _SwitchThemeState extends State<SwitchTheme>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  var isNightTheme = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      // iconSize: 50,
      icon: Icon(
          isNightTheme ? Icons.wb_sunny_outlined : Icons.nights_stay_outlined),
      onPressed: () => _handleOnPressed(),
    );
  }

  void _handleOnPressed() {
    setState(() {
      isNightTheme = !isNightTheme;
      isNightTheme
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }
}
