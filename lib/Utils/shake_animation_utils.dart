import 'package:flutter/material.dart';
import 'dart:math' as math;

class SineCurve extends Curve {
  SineCurve({this.count = 3});

  final double count;

  @override
  double transformInternal(double t) {
    return math.sin(count * 2 * math.pi * t);
  }
}

abstract class AnimationControllerState<T extends StatefulWidget>
    extends State<T> with SingleTickerProviderStateMixin {
  AnimationControllerState(this.animationDuration);

  final Duration animationDuration;

  late final animationController = AnimationController(
    vsync: this,
    duration: animationDuration,
  );

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class CustomShakeWidget extends StatefulWidget {
  const CustomShakeWidget({
    required this.child,
    required this.duration,
    required this.shakeCount,
    required this.shakeOffset,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final double shakeOffset;
  final int shakeCount;
  final Duration duration;

  @override
  // ignore: no_logic_in_create_state
  State<CustomShakeWidget> createState() => CustomShakeWidgetState(duration);
}

class CustomShakeWidgetState
    extends AnimationControllerState<CustomShakeWidget> {
  CustomShakeWidgetState(Duration duration) : super(duration);

  @override
  void initState() {
    super.initState();
    animationController.addStatusListener(_updateStatus);
  }

  @override
  void dispose() {
    animationController.removeStatusListener(_updateStatus);
    super.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: widget.child,
      builder: (context, child) {
        final sinValue = math
            .sin(widget.shakeCount * 2 * math.pi * animationController.value);
        return Transform.translate(
          offset: Offset(sinValue * widget.shakeOffset, 0),
          child: widget.child,
        );
      },
    );
  }


  void shake(){
    animationController.forward();
  }
}