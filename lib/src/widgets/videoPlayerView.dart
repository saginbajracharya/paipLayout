import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  VideoPlayerView({Key? key, required this.videoUrl,required this.swipe,required this.navigated,required this.index,required this.shownIndex}) : super(key: key);
 
  final String videoUrl;
  final bool swipe;
  final bool navigated;
  final int index;
  final int shownIndex;
 
  @override
  _VideoPlayerViewState createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> with SingleTickerProviderStateMixin{
  late VideoPlayerController videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  late AnimationController _controller;
  // final HomePageController _homeCon = Get.put(HomePageController());
  String defaultImage               = 'assets/design.jpg';
  bool volume                       = true;

  @override
  void initState(){
    _controller = AnimationController(duration: const Duration(milliseconds: 0), vsync: this);
    initilizeVideo();
    super.initState();
  }

  @override
  void didUpdateWidget(VideoPlayerView oldWidget) {
    onTabChange();
    setVolume();
    playIndexVideo();
    if(widget.swipe==true || widget.navigated==true){
      if (videoPlayerController.value.isPlaying) {
        videoPlayerController.pause();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  initilizeVideo(){
    videoPlayerController = new VideoPlayerController.network(widget.videoUrl)
    ..initialize().then((_) {
      setState(() {
        onTabChange();
        setVolume();
        playIndexVideo();
      });
    });
    // Initielize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = videoPlayerController.initialize();
  }

  onTabChange(){
    // if(_homeCon.tabIndex!=0){
    //   if (videoPlayerController.value.isPlaying) {
    //     videoPlayerController.pause();
    //   }
    // }
  }

  setVolume(){
    if(volume==false){
      videoPlayerController.setVolume(0);
    }
    else{
      videoPlayerController.setVolume(100);
    }
  }

  playIndexVideo(){
    if(widget.shownIndex==widget.index && videoPlayerController.value.isInitialized){
      videoPlayerController.play();
      videoPlayerController.setLooping(true);
    }
  }

  playAnimation(){
    _controller.duration = const Duration(milliseconds: 1500);
    _controller.repeat(reverse: false);
  }

  resetAnimation(){
    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (videoPlayerController.value.isInitialized) {
          return Stack(
            children: [
              Center(
                child: Container(
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(videoPlayerController),
                  ),
                )
              ),
              //Video Progress Indicator
              Align(
                alignment: Alignment.bottomCenter,
                child: VideoProgressIndicator(
                  videoPlayerController,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    backgroundColor: Colors.transparent,
                    bufferedColor: Colors.white24,
                    playedColor: Colors.white,
                  )
                ),
              ),
              // Play Pause 
              //hidden play Pause
              Container(
                height: 530,
                // color: Colors.amber,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (videoPlayerController.value.isPlaying) {
                        videoPlayerController.pause();
                      } else {
                        videoPlayerController.play();
                      }
                    });
                  }
                ),
              ),
              //top left play pause
              IconButton(
                splashRadius: 0.1,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(20),
                color: Colors.white70.withOpacity(0.8),
                iconSize:20.0,
                icon: videoPlayerController.value.isPlaying
                ?Icon(
                  Icons.pause,
                )
                :Icon(
                  Icons.play_arrow,
                ),
                onPressed: () {
                  setState(() {
                    if (videoPlayerController.value.isPlaying) {
                      videoPlayerController.pause();
                    } else {
                      videoPlayerController.play();
                    }
                  });
                },
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  splashRadius: 0.1,
                  padding: EdgeInsets.all(20),
                  color: Colors.white70.withOpacity(0.8),
                  iconSize:22.0,
                  icon: volume
                  ?Icon(
                    Icons.volume_up,
                  )
                  :Icon(
                    Icons.volume_off,
                  ),
                  onPressed: () {
                    setState(() {
                      if (volume==true) {
                        videoPlayerController.setVolume(0);
                        volume = false;
                      } else {
                        videoPlayerController.setVolume(100);
                        volume = true;
                      }
                    });
                  },
                ),
              ),
            ],
          );
        } 
        // If the VideoPlayerController is still initializing, show a loading .
        else {
          return Stack(
            alignment:Alignment.topRight,
            children: [
              RotationTransition(
              turns: Tween(begin: 1.0, end: 0.0).animate(_controller),
              child: IconButton(
                splashRadius: 5.0,
                splashColor: Colors.red,
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(20),
                color: Colors.white70.withOpacity(0.8),
                iconSize:20.0,
                disabledColor: Colors.amber,
                icon: Icon(
                  Icons.replay_outlined,
                ),
                onPressed: () {
                  setState(() {
                    print('reload');
                    playAnimation();
                    initilizeVideo();
                  });
                },
              ),
            ),
              Align(
                alignment: Alignment.bottomCenter,
                child: VideoProgressIndicator(
                  videoPlayerController,
                  allowScrubbing: false,
                  colors: VideoProgressColors(
                    backgroundColor: Colors.transparent,
                    bufferedColor: Colors.white24,
                    playedColor: Colors.white,
                  )
                ),
              )
            ],
          );
        }
      },
    );
  }
  
  @override
  void dispose() {
    _initializeVideoPlayerFuture = Future<void>.value(0);
    videoPlayerController.pause().then((_) {
      videoPlayerController.dispose();
    });
    _controller.dispose();
    super.dispose();
  }

}