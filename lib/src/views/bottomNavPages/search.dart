import 'package:flutter/material.dart';
import 'package:paiplayout/src/widgets/appBarTitleOnly.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> with TickerProviderStateMixin {
  
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: appBarTitleOnly(title: 'search'),
        body: Center(child: Text('search'))
      )
    );
  }
}