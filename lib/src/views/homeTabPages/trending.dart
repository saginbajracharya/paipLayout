import 'package:flutter/material.dart';

class Trending extends StatefulWidget {
  Trending({Key? key,required this.selectedIndex}) : super(key: key);
  final int selectedIndex;
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  TextEditingController comment = TextEditingController();
  PageController controller = PageController(initialPage: 0);
  bool emojiShowing = false;
  bool isLiked = false;
  bool isCliked = false;
  int filter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Trending'))
    );
  }
}