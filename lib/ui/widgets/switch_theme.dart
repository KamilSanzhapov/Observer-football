import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:football_explorer/app/theme/theme_notifier.dart';

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
    return ThemeSwitcher(
      clipper: MyClipper(
        sizeRate: 120,
        offset: Offset(10, 15),
      ),
      builder: (context) {
        return IconButton(
          // iconSize: 50,
          icon: Icon(
              isNightTheme ? Icons.lightbulb : Icons.lightbulb_outline_rounded),
          onPressed: () => _handleOnPressed(context),
        );
      },
    );
  }

  void _handleOnPressed(BuildContext context) {
    setState(() {
      isNightTheme = !isNightTheme;
      if (isNightTheme) {
        ThemeSwitcher.of(context).changeTheme(theme: darkTheme);
        _animationController.forward();
      } else {
        ThemeSwitcher.of(context).changeTheme(theme: lightTheme);
        _animationController.reverse();
      }
    });
  }
}

class MyClipper extends ThemeSwitcherClipper {
  MyClipper({this.sizeRate, this.offset});

  final double sizeRate;
  final Offset offset;

  @override
  Path getClip(Size size, Offset offset, double sizeRate) {
    var path = Path();
    path.addOval(
      Rect.fromCircle(center: offset, radius: size.height * sizeRate),
    );

    return path;
  }

  @override
  bool shouldReclip(
          CustomClipper<Path> oldClipper, Offset offset, double sizeRate) =>
      true;
}
