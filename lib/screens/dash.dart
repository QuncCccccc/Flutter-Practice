import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key, required this.dancing}) : super(key: key);

  final bool dancing;

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  late final SimpleAnimation _dance = SimpleAnimation(
    'slowDance',
    autoplay: widget.dancing,
  );

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      'assets/dash.riv',
      controllers: [
        _dance,
      ],
    );
  }
}
