import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paiplayout/src/controller/judgingController.dart';
import 'package:paiplayout/src/widgets/circularAvatarWidget.dart';

class CardDetail extends StatefulWidget {
  CardDetail({Key? key,required this.data}) : super(key: key);
  final data;
  
  @override
  _CardDetailState createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  final JudgingController _con = Get.put(JudgingController());
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(top:0.0,left:10.0,right:10.0,bottom:8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:MainAxisAlignment.end,
          children: [
            //Name,avatar,followers // on click show bottom sheet with detail
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () { 
                    _con.navigated = true;
                    print(widget.data);
                  }, 
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment:MainAxisAlignment.start,
                    children: [
                      HeroMode(
                        child: Hero(
                          tag: widget.data["id"], 
                          child: CircularAvatarWidget(imageUrl: widget.data["profileImage"], width: 34,height: 34), 
                        ),
                        enabled: true,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        '${widget.data["name"]}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 13
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left
                      ),
                    ],
                  ),
                ),
                SizedBox(height:10)
              ],
            ),
          ],
        ),
      ),
    );
  }
}