import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class JudgingController extends GetxController {
  String defaultImage         = 'assets/design.jpg';
  bool isLoading              = true;
  List<dynamic> stackListData = [];
  String videoUrl             = "";
  int shownCardIndex          = 0;
  bool navigated              = false;
  bool swipe                  = false;

  @override
  void onInit() { 
    super.onInit();
  }

  void loadJsonData() async {
    try {
      isLoading = true;
      shownCardIndex = 0;
      stackListData.clear();
      var jsonText = await rootBundle.loadString('assets/data.json');
      stackListData.addAll(json.decode(jsonText));
      // print(stackListData);
    } finally {
      isLoading = false;
      update();
    }
  }

  swipeLeftOrRightCheck(BuildContext context,int orientationIndex, list, int currentIndex, int nextIndex) {
    swipe = false;
    // Card is LEFT swiping
    if (orientationIndex == 0) {
      swipe = true;
      shownCardIndex++;
      changeVideo(currentIndex,list,nextIndex);
    }
    //Card is RIGHT swiping
    else if (orientationIndex == 1) {
      swipe = true;
      shownCardIndex++;
      changeVideo(currentIndex,list,nextIndex);
    }
    else if (orientationIndex == 2) {
      swipe = true;
      shownCardIndex++;
      // changeVideo(currentIndex,list,nextIndex);
    }
    //Card list is about to finish
    if (currentIndex >= stackListData.length - 1 && swipe == true) {
      loadJsonData();
    }
  }

  changeVideo(currentIndex, list, nextIndex) {
    if (list.length > nextIndex) {
      if(list[nextIndex]["postType"]=="video"){
        videoUrl = list[nextIndex]["contentUrl"];
      }
    }
    else{
      videoUrl = '';
    }
    update();
  }
}