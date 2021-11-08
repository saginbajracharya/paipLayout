import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paiplayout/src/controller/judgingController.dart';
import 'package:paiplayout/src/widgets/swipableCardsWidget.dart';

class Judging extends StatefulWidget {
  Judging({Key? key, required this.selectedIndex}) : super(key: key);
  final int selectedIndex;
  @override
  _JudgingState createState() => _JudgingState();
}

class _JudgingState extends State<Judging>{
  final JudgingController _con = Get.put(JudgingController());
  void initState() {
    super.initState();
    _con.loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<JudgingController>(
              init: JudgingController(), // INIT IT ONLY THE FIRST TIME
              builder: (_) {
                return bgContainerAndCardView();
              }
            ),
          ],
        ),
      )
    );
  }

  Widget bgContainerAndCardView() =>
  Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: _con.isLoading == true 
      ?Center(
        child: CircularProgressIndicator(
          valueColor:AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      )
      :_con.stackListData.length==0
      ?Center(child: Text('No Data Found'))
      :SwipableCardsWidget(list: _con.stackListData) 
  );
}
