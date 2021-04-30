import 'package:flutter/material.dart';
class ViewImage extends StatefulWidget {
  String imageUrl;

  @override
  _ViewImageState createState() => _ViewImageState();

  ViewImage(this.imageUrl);
}

class _ViewImageState extends State<ViewImage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Image.network(widget.imageUrl),
    ));
  }
}
