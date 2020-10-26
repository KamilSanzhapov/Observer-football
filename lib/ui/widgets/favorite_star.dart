import 'package:flutter/material.dart';

class FavoriteStar extends StatelessWidget {
  final bool isPressed;
  final Function(bool isPressed) onSwitch;

  FavoriteStar({this.isPressed = false, this.onSwitch});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isPressed
          ? Icon(
              Icons.star,
              color: Colors.orangeAccent,
            )
          : Icon(
              Icons.star_border,
              color: Theme.of(context).accentColor,
            ),
      onPressed: () {
        onSwitch(!isPressed);
      },
    );
  }
}
