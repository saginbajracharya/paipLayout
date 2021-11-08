import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:paiplayout/src/widgets/imageView.dart';

class StackCardCarousel extends StatefulWidget {
  StackCardCarousel({Key? key, required this.data}) : super(key: key);
  final data;
  @override
  _StackCardCarouselState createState() => _StackCardCarouselState();
}

class _StackCardCarouselState extends State<StackCardCarousel> {
  SwiperController _swipeController = SwiperController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Swiper(
        physics                     : AlwaysScrollableScrollPhysics(),
        scrollDirection             : Axis.horizontal,
        itemCount                   : widget.data["images"].length,
        layout                      : SwiperLayout.DEFAULT,
        autoplay                    : false,
        duration                    : 6,
        autoplayDisableOnInteraction: true,
        loop                        : true,
        itemHeight                  : double.infinity,
        itemWidth                   : double.infinity,
        fade                        : 1.0,
        controller                  : _swipeController,
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            color      : Colors.white54,
            activeColor: Colors.white,
            size       : 8.0,
            activeSize : 10.0,
            space      : 3.0,
          ),
        ),
        itemBuilder: (BuildContext context, int imgIndex) {
          return Stack(
            children:[
              ImageView(url:widget.data["images"][imgIndex]),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: (){
                    _swipeController.previous(animation: true);
                  },
                  child: Container(
                    height:double.infinity,
                    width: MediaQuery.of(context).size.width/5,
                    color: Colors.transparent,
                  ),
                )
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (){
                    _swipeController.next(animation: true);
                  },
                  child: Container(
                    height:double.infinity,
                    width: MediaQuery.of(context).size.width/5,
                    color: Colors.transparent,
                  ),
                )
              ),
            ]
          );
        },
      )
    );
  }
}