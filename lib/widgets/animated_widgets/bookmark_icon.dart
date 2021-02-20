import 'package:flutter/material.dart';

class BookmarkIcon extends StatefulWidget {
  final Color iconColor;

  BookmarkIcon({this.iconColor});

  @override
  _BookmarkIconState createState() => _BookmarkIconState();
}

class _BookmarkIconState extends State<BookmarkIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  IconData _currentIconData = Icons.bookmark_outline;

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
                _currentIconData,
                color: widget.iconColor,
                size: 23,
              ),
              onTap: () {
                if (_currentIconData == Icons.bookmark) {
                  _currentIconData = Icons.bookmark_outline;
                } else {
                  _currentIconData = Icons.bookmark;
                }
                _animationController.forward();
              },
            ),
          );
        });
  }
}
