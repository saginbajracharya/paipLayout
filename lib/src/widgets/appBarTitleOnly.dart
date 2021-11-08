import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar appBarTitleOnly({required String title}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    centerTitle: true,
    title:Text(title,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.white)),
  );
}