import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final String text;
  final String logoUrl;
  final GestureTapCallback onTap;
  final String subtitle;
  final Widget trailing;

  Tile({this.text, this.logoUrl, this.onTap, this.trailing, this.subtitle = ""}) ;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Image.network(logoUrl, width: 32, fit: BoxFit.fill),
        ),
        title: Text(text, style: Theme.of(context).textTheme.bodyText1, ),
        trailing: trailing == null ? Icon(Icons.arrow_right) : trailing,
        onTap: this.onTap,
        subtitle: subtitle.isEmpty ? null : Text(subtitle, style: Theme.of(context).textTheme.subtitle1),
      ),
    );
  }
}
