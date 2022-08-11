library animated_dashed_circle;

import 'package:animated_dashed_circle/animated_dashed_circle_view.dart';
import 'package:flutter/material.dart';

AnimationController? circleController;

enum AnimatedionDashedCircleType { forward, repeat }

class AnimatedDashedCircle {
  Future<void> playCircle({AnimatedionDashedCircleType type = AnimatedionDashedCircleType.forward}) async {
    if (type == AnimatedionDashedCircleType.forward) {
      circleController?.reset();
      circleController?.forward();
    } else {
      circleController?.repeat();
    }
  }

  Future<void> stopCircle() async {
    circleController?.reset();
  }

  Widget show(
      {required ImageProvider<Object> image,
      double? height,
      Duration? duration,
      bool? autoPlay,
      double? borderWidth,
      int? dashSize,
      Color color = Colors.red,
      double? contentPadding}) {
    return AnimatedDashedCircleView(
      image: image,
      duration: duration,
      height: height,
      autoPlay: autoPlay ?? true,
      borderWidth: borderWidth ?? 3,
      dashSize: dashSize ?? 20,
      color: color,contentPadding: contentPadding,
    );
  }
}
