// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class ScrollToLoadMore extends StatefulWidget {
  @override
  _ScrollToLoadMoreState createState() => _ScrollToLoadMoreState();
}

class _ScrollToLoadMoreState extends State<ScrollToLoadMore> {
  List<int> items = List.generate(20, (index) => index);

  ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadMoreData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      await Future.delayed(Duration(seconds: 2));

      setState(() {
        items.addAll(List.generate(20, (index) => index + items.length));
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll to Load More'),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (!isLoading &&
              scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            _loadMoreData();
          }
          return true;
        },
        child: GridView.builder(
          controller: _scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: items.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index < items.length) {
              return Container(
                color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    'Item $index',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
