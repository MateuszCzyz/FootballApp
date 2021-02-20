import 'package:flutter/material.dart';

class ShareIcon extends StatefulWidget {
  @override
  _ShareIconState createState() => _ShareIconState();
}

class _ShareIconState extends State<ShareIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100))
          ..addListener(() {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            }
          });
    _animation =
        Tween<double>(begin: 1.0, end: 1.2).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Transform.scale(
            scale: _animation.value,
            child: InkWell(
              child: Icon(
                Icons.share,
                color: Colors.white,
                size: 20,
              ),
              onTap: () {
                _animationController.forward();
              },
            ),
          );
        });
  }
}
