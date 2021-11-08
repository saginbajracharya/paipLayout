import 'package:flutter/material.dart';

class Following extends StatefulWidget {
  Following({Key? key, required this.selectedIndex}) : super(key: key);
  final int selectedIndex;

  @override
  _FollowingState createState() => _FollowingState();
}

class _FollowingState extends State<Following> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('following'))
    );
  }
}
