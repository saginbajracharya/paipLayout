import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paiplayout/src/controller/judgingController.dart';
import 'package:paiplayout/src/widgets/cardDetail.dart';
import 'package:paiplayout/src/widgets/imageView.dart';
import 'package:paiplayout/src/widgets/stackCardCarousel.dart';
import 'package:paiplayout/src/widgets/videoPlayerView.dart';
// import 'package:paip/src/widgets/vlcVideoPlayer.dart';

class CardViewWidget extends StatefulWidget {
  final int index;
  final int length;
  final singlelistData;
  CardViewWidget({Key? key,required this.index,required this.length, required this.singlelistData}) : super(key: key);

  @override
  _CardViewWidgetState createState() => _CardViewWidgetState();
}

class _CardViewWidgetState extends State<CardViewWidget> {
  final JudgingController _con = Get.put(JudgingController());
  @override
  Widget build(BuildContext context) {
    // _con.videoUrl = widget.singlelistData['videoUrl'];
    return Card(
      color: Colors.grey[800],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                    Colors.black87.withOpacity(0.6), 
                    BlendMode.darken
                  ),
                  image: Image.asset(_con.defaultImage).image,
                  fit: BoxFit.cover
                )
              ),
              child: 
              widget.singlelistData["postType"] == 'video' 
              && _con.videoUrl != "" 
              && _con.shownCardIndex == widget.index //add card video in all card at first if commented
                //video 
                ? VideoPlayerView(
                  videoUrl: _con.videoUrl,
                  swipe: _con.swipe, 
                  navigated: _con.navigated,
                  index : widget.index,
                  shownIndex: _con.shownCardIndex
                ):
              widget.singlelistData["postType"] == 'multiimage' 
                //Carousel
                ?StackCardCarousel(data: widget.singlelistData)
                //Single Image
              :widget.singlelistData["postType"] == 'image'
                ?ImageView(
                  url:widget.singlelistData["images"][0]
                )
              :SizedBox()
            )
          ),
          //Details
          CardDetail(data: widget.singlelistData),
        ],
      ),
    );
  }
}