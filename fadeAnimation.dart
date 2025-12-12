
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
final double delay;
final Widget child;

const FadeAnimation({
super.key,
required this.delay,
required this.child,
});

@override
Widget build(BuildContext context) {
return PlayAnimationBuilder<double>(
delay: Duration(milliseconds: (500 * delay).round()),
duration: const Duration(milliseconds: 600),
tween: Tween(begin: 0.0, end: 1.0),
curve: Curves.easeOut,
builder: (context, value, _) {
return Opacity(
opacity: value,
child: Transform.translate(
offset: Offset(120 * (1 - value), 0),
child: child,
),
);
},
);
}
}

