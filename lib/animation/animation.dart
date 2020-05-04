import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';


class FadeAnimation extends StatefulWidget{
  final double delay;
  final Widget child;



FadeAnimation (this.delay, this.child);

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation> {
@override
Widget build (BuildContext context)
{
  final tween = MultiTrackTween ([
    Track("opacity").add(Duration(milliseconds: 500), 
    Tween(begin: 0.0, end:1.0)),
    Track ("translateY").add
    (Duration(milliseconds:500), 
    Tween(begin: -30.0, end: 0.0),
     curve: Curves.easeOut)
   
  ]);
  return ControlledAnimation(
    delay: Duration
    (milliseconds:(500 * widget.delay).round()),
    duration: tween.duration,
    tween: tween,
    child: widget.child,
    builderWithChild: (context, child,
     animation) => Opacity
    (opacity: animation["opacity"],
    child: Transform.translate(offset: Offset(0, animation["translateY"]),
    
    child: child,
    ),
    
    ),
    );
}
}