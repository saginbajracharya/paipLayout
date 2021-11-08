import 'package:flutter/material.dart';
import 'package:paiplayout/src/widgets/appBarTitleOnly.dart';

class Add extends StatefulWidget {
  Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final navigatorKey = GlobalKey<NavigatorState>();
  bool isLoading = false;
  // late XFile _video;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: appBarTitleOnly(title: 'add'),
        body: Center(child: Text('add'))
      )
    );
  }
}