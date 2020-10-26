import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullToRefresh extends StatefulWidget {
  final Widget child;
  final Function(BuildContext ctx) onRefresh;

  PullToRefresh({this.child, this.onRefresh});

  @override
  _PullToRefreshState createState() => _PullToRefreshState();
}

class _PullToRefreshState extends State<PullToRefresh> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {
    //_refreshController.requestRefresh();

    return SmartRefresher(
      controller: _refreshController,
      enablePullUp: false,
      //physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(top: 32),
        child: widget.child,
      ),
      onRefresh: () async {
        _refreshController.requestLoading();
        widget.onRefresh(context);
        _refreshController.refreshCompleted();
      },
    );
  }
}
