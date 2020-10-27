import 'package:flutter/material.dart';

AppBar getAppBar(BuildContext context, String _title,
    {Widget icon, List<Widget> actions, Widget bottom}) {
  return AppBar(
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50, bottom: 50),
          child: icon,
        ),
        SizedBox(
          width: 10,
        ),
        Text(_title, style: Theme.of(context).textTheme.bodyText2),
      ],
    ),
    centerTitle: true,
    backgroundColor: Colors.black87,
    actions: actions,
    bottom: bottom,
  );
}
