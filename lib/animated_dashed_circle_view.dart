library animated_dashed_circle;

import 'package:animated_dashed_circle/animated_dashed_circle.dart';
import 'package:animated_dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';

class AnimatedDashedCircleView extends StatefulWidget {
  final ImageProvider<Object> image;
  final double? height;
  final Duration? duration;
  final bool autoPlay;
  final double borderWidth;
  final int dashSize;
  final Color color;
  final double? contentPadding;
  const AnimatedDashedCircleView(
      {Key? key,
      required this.image,
      required this.autoPlay,
      this.height,
      this.duration,
      required this.borderWidth,
      required this.dashSize,
      required this.color,
      this.contentPadding})
      : super(key: key);

  @override
  State<AnimatedDashedCircleView> createState() => _AnimatedDashedCircleViewState();
}

class _AnimatedDashedCircleViewState extends State<AnimatedDashedCircleView> with SingleTickerProviderStateMixin {
  Animation? gap;
  Animation<double>? base;
  Animation<double>? reverse;
  double size = 0;

  @override
  void initState() {
    super.initState();
    size = widget.height ?? 100;
    circleController = AnimationController(vsync: this, duration: widget.duration ?? const Duration(seconds: 5));
    base = CurvedAnimation(parent: circleController!, curve: Curves.easeOut);
    reverse = Tween<double>(begin: 0.0, end: -1.0).animate(base!);
    gap = Tween<double>(begin: 3.0, end: 0.0).animate(base!)
      ..addListener(() {
        setState(() {});
      });

    if (widget.autoPlay) {
      AnimatedDashedCircle().playCircle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: RotationTransition(
        turns: base!,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: DashedCircle(
            gapSize: gap!.value,
            dashes: widget.dashSize,
            color: widget.color,
            strokeWidth: widget.borderWidth,
            child: RotationTransition(
              turns: reverse!,
              child: CircleAvatar(
                radius: size,
                backgroundColor: Colors.white,
                // burda o bordur kalınlaşacak
                child: Padding(
                  padding: EdgeInsets.all(widget.contentPadding ?? 3),
                  child: CircleAvatar(
                    radius: size,
                    backgroundImage: widget.image,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
