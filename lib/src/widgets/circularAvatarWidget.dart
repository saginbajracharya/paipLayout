import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircularAvatarWidget extends StatefulWidget {
  CircularAvatarWidget({Key? key, required this.imageUrl , required this.width, required this.height}) : super(key: key);
  final String imageUrl;
  final double width;
  final double height;

  @override
  _CircularAvatarWidgetState createState() => _CircularAvatarWidgetState();
}

class _CircularAvatarWidgetState extends State<CircularAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(500.0),
      child: widget.imageUrl!=''?CachedNetworkImage(
        fit: BoxFit.cover,
        width: widget.width,
        height: widget.height,
        placeholder: (context, url) => CircularProgressIndicator(color: Colors.white),
        imageUrl:"${widget.imageUrl}",
      ):Image.asset(
        'assets/images/noProfileImage.jpg',
        width: widget.width,
        height: widget.height,
      ),
    );
  }
}