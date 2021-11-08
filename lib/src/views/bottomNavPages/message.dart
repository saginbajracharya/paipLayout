import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paiplayout/src/widgets/appBarTitleOnly.dart';

class Message extends StatefulWidget {
  Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: appBarTitleOnly(title: 'message'.tr),
        body: Center(child: Text('Message')),
      )
    );
  }
}