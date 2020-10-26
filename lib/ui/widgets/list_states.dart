import 'package:flutter/material.dart';

class NoDataStateList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.not_interested_outlined,
            size: 48,
            color: Theme.of(context).accentColor,
          ),
          SizedBox(
            width: 10,
          ),
          Text('Data not found', style: Theme.of(context).textTheme.headline2),
        ],
      ),
    );
  }
}

class ErrorStateList extends StatelessWidget {
  final String text;

  ErrorStateList(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text, style: Theme.of(context).textTheme.headline2),
    );
  }
}

class LoadingStateList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
