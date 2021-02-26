import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/utils/my_colors.dart';
import 'package:portfolio/widgets/typing_text.dart';
import 'package:url_launcher/url_launcher.dart';

class Who extends StatefulWidget {
  @override
  _WhoState createState() => _WhoState();
}

class _WhoState extends State<Who> with SingleTickerProviderStateMixin {
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
                    child: Text('I\'m Abhishek Upmanyu',
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
                  ),
                  Text('Coder & Designer',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w100,
                          fontSize: 36.0,
                          decoration: TextDecoration.none)),
                  Text('Full Stack Flutter Developer',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w100,
                          fontSize: 22.0,
                          decoration: TextDecoration.none)),
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
                  Text('HIO!', style: _highlighted),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(children: [
                      TextSpan(text: 'I\'m a ', style: _normal),
                      TextSpan(text: '20 ', style: _highlighted),
                      TextSpan(text: 'year old ', style: _normal),
                      TextSpan(text: 'Flutter Developer ', style: _highlighted),
                      TextSpan(
                          text: 'with over 2 years of development experience. ',
                          style: _normal),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
