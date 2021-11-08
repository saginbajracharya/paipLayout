import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paiplayout/src/controller/judgingController.dart';
import 'package:paiplayout/src/widgets/cardViewWidget.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:swipable_stack/swipable_stack.dart';

class SwipableCardsWidget extends StatefulWidget {
  SwipableCardsWidget({Key? key, required this.list}) : super(key: key);
  final List list;
  @override
  _SwipableCardsWidgetState createState() => _SwipableCardsWidgetState();
}

class _SwipableCardsWidgetState extends State<SwipableCardsWidget> {
  final JudgingController _con = Get.put(JudgingController());
  SwipableStackController _controller = SwipableStackController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          margin: EdgeInsets.only(top:sy(72),bottom: sy(30)),
          padding: EdgeInsets.only(bottom:30,top:8.0,left:8.0,right:8.0),
          // color: Colors.lightGreen,
          child: SwipableStack(
            viewFraction: 0.9,
            controller: _controller,
            itemCount: widget.list.length,
            verticalSwipeThreshold: 1,
            stackClipBehaviour: Clip.none,
            swipeAssistDuration: Duration(milliseconds: 50),
            onWillMoveNext: (index, direction) {
              final allowedActions = [
                SwipeDirection.right,
                SwipeDirection.left,
                SwipeDirection.up,
              ];
              return allowedActions.contains(direction);
            },
            onSwipeCompleted: (index, direction) {
              _con.swipeLeftOrRightCheck(context,direction.index, widget.list, index, index + 1);
              // print('$index, $direction');
            }, 
            overlayBuilder: (context,constraints,index,direction,swipeProgress) {
              final opacity = min(swipeProgress, 1.0);
              final isRight = direction == SwipeDirection.right;
              final isLeft = direction == SwipeDirection.left;
              final isUp = direction == SwipeDirection.up;
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Opacity(
                        opacity: isRight ? opacity : 0,
                        child: Text(
                          'Like',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                            color: Colors.green[500],
                            shadows: [
                              Shadow( // bottomLeft
                                offset: Offset(-1, -1),
                                color: Colors.black
                              ),
                              Shadow( // bottomRight
                                offset: Offset(1, -1),
                                color: Colors.black
                              ),
                              Shadow( // topRight
                                offset: Offset(1, 1),
                                color: Colors.black
                              ),
                              Shadow( // topLeft
                                offset: Offset(-1, 1),
                                color: Colors.black
                              ),
                            ]
                          ),
                        )
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Opacity(
                        opacity: isLeft ? opacity : 0,
                        child: Text(
                          'Nope',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                            color: Colors.red[500],
                            shadows: [
                              Shadow( // bottomLeft
                                offset: Offset(-1, -1),
                                color: Colors.black
                              ),
                              Shadow( // bottomRight
                                offset: Offset(1, -1),
                                color: Colors.black
                              ),
                              Shadow( // topRight
                                offset: Offset(1, 1),
                                color: Colors.black
                              ),
                              Shadow( // topLeft
                                offset: Offset(-1, 1),
                                color: Colors.black
                              ),
                            ]
                          ),
                        )
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Opacity(
                        opacity: isUp ? opacity : 0,
                        child: Text(
                          'Super\nLike',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                            color: Colors.yellow[700],
                            height: 1.2, // the height between text, default is null
                            letterSpacing: 1.0, // the white space between letter, default is 0.0
                            shadows: [
                              Shadow( // bottomLeft
                                offset: Offset(-1, -1),
                                color: Colors.black
                              ),
                              Shadow( // bottomRight
                                offset: Offset(1, -1),
                                color: Colors.black
                              ),
                              Shadow( // topRight
                                offset: Offset(1, 1),
                                color: Colors.black
                              ),
                              Shadow( // topLeft
                                offset: Offset(-1, 1),
                                color: Colors.black
                              ),
                            ]
                          ),
                        )
                      ),
                    ),
                  ],
                ),
              );
            },
            builder: (BuildContext context, int index, BoxConstraints constraints) { 
              return CardViewWidget(
                index          : index, 
                length         : widget.list.length, 
                singlelistData : widget.list[index]
              );
            },
          )
        );
      }
    );
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
}
