import 'package:flutter/material.dart';

class Supporting extends StatefulWidget {
  Supporting({Key? key,required this.selectedIndex}) : super(key: key);
  final int selectedIndex;

  @override
  _SupportingState createState() => _SupportingState();
}

class _SupportingState extends State<Supporting> {

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Supporting'))
    );
  }
}

