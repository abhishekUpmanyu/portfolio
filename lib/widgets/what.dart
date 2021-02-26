import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/utils/my_colors.dart';

class What extends StatefulWidget {
  @override
  _WhatState createState() => _WhatState();
}

class _WhatState extends State<What> with TickerProviderStateMixin{
  AnimationController _glitchTextController;
  Animation _glitchTextAnimation;

  final TextStyle _normal = TextStyle(
      color: Colors.white,
      fontFamily: 'Nunito Sans',
      fontWeight: FontWeight.w100,
      fontSize: 18.0,
      decoration: TextDecoration.none);

  String _centerText;

  @override
  void initState() {
    _glitchTextController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    _glitchTextAnimation =
        CurvedAnimation(parent: _glitchTextController, curve: Curves.linear);
    _glitchTextAnimation.addListener(() => setState(() {}));
    _glitchTextController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    final TextStyle _highlighted = TextStyle(
        shadows: <Shadow>[
          Shadow(
              color: MyColors.color16,
              offset: Offset(
                  _glitchTextAnimation.value * random.nextDouble() * 2.0,
                  _glitchTextAnimation.value * random.nextDouble() * 2.0))
        ],
        color: MyColors.color17,
        fontFamily: 'Oswald',
        fontSize: 22.0,
        decoration: TextDecoration.none);
    var mediaQuery = MediaQuery.of(context);
    return Container(
      height: mediaQuery.size.height * 3,
      width: mediaQuery.size.width,
      color: MyColors.color18,
      child: Column(
        children: [
          Container(
            height: mediaQuery.size.height,
            width: mediaQuery.size.width,
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: mediaQuery.size.width / 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('WHAT',
                        style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                  color: MyColors.color16,
                                  offset: Offset(5.0, 5.0))
                            ],
                            color: MyColors.color17,
                            fontFamily: 'Oswald',
                            fontSize: 96.0,
                            decoration: TextDecoration.none)),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: mediaQuery.size.height,
            width: mediaQuery.size.width,
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: mediaQuery.size.width / 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/the-ascii-emoji-app-main-icon.png', width: 200),
                  Text('The ASCII Emoji App ¯\\_(ツ)_/¯', style: _highlighted),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
