import 'package:flutter/material.dart';

class AvatarAnimation extends StatefulWidget {
  final ImageProvider avatar;

  AvatarAnimation({
    this.avatar,
  });

  @override
  _AvatarAnimationState createState() => _AvatarAnimationState();
}

class _AvatarAnimationState extends State<AvatarAnimation>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Tween<double> _tween = Tween(begin: 1, end: 1.1);
  double _radius = 50;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      // Border color
      radius: _radius,
      backgroundColor: Colors.redAccent.shade200,
      child: ScaleTransition(
        scale: _tween.animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.elasticIn,
          ),
        ),
        child: CircleAvatar(
          radius: _radius - 2,
          backgroundImage: widget.avatar,
        ),
      ),
    );
  }
}
