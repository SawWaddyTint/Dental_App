import 'package:flutter/material.dart';

class SmartHorizontalListView extends StatefulWidget {
  final int? itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Function onListEndReached;
  final Function pullToRefreshList;
  SmartHorizontalListView(
      {required this.itemCount,
      required this.itemBuilder,
      required this.onListEndReached,
      required this.pullToRefreshList});

  @override
  _SmartHorizontalListViewState createState() =>
      _SmartHorizontalListViewState();
}

class _SmartHorizontalListViewState extends State<SmartHorizontalListView> {
  var _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          print("Start of the list reached");
        } else {
          print("End of the list reached");
          widget.onListEndReached();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return this.widget.pullToRefreshList();
      },
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: this.widget.itemCount,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          controller: _scrollController,
          itemBuilder: this.widget.itemBuilder),
    );
  }
}
