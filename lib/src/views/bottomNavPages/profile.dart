import 'package:flutter/material.dart';
import 'package:paiplayout/src/widgets/appBarTitleOnly.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: appBarTitleOnly(title: 'profile'),
        body: Center(child: Text('Profile'))
      )
    );
  }

}
