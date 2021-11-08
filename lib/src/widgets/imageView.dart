import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageView extends StatefulWidget {
  ImageView({Key? key,required this.url}) : super(key: key);
  final String url;
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  String defaultImage = 'assets/design.jpg';
  String placeholderImage = 'assets/noProfileImage.jpg';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: CircularProgressIndicator(color: Colors.white)),
        Center(
          child: FadeInImage.memoryNetwork(
            fadeInDuration : Duration(milliseconds : 2),
            fadeOutDuration: Duration(milliseconds : 2),
            fit            : BoxFit.cover,
            alignment      : Alignment.center,
            height         : double.infinity,
            width          : double.infinity,
            placeholder    : kTransparentImage,
            image          : widget.url,
            imageErrorBuilder:(context, error, stackTrace) {
              return Image.asset(
                placeholderImage,
                width  : double.infinity,
                height : double.infinity,
                fit    : BoxFit.fitWidth,
              );
            },
          ),
        )
      ],
    );
  }
}