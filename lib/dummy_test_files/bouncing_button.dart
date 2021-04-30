import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Avatar();
}

class _Avatar extends State<Avatar> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    this._controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            child: ScaleTransition(
              scale: Tween(begin: 0.75, end: 2.0).animate(CurvedAnimation(
                  parent: _controller, curve: Curves.elasticOut)),
              child: SizedBox(
                height: 100,
                width: 100,
                child: GestureDetector(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://rlv.zcache.co.uk/cute_hipster_red_fox_round_sticker-r496682b6bb8d4f50baf8e43406c27546_v9waf_8byvr_324.jpg"),
                  ),
                  onTap: animation,
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
  void animation(){
    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    _controller.forward();
  }
}
