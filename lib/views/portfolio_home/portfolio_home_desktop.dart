import 'package:flutter/material.dart';
import 'package:portfolio/utils/my_colors.dart';
import 'package:portfolio/widgets/navbar.dart';
import 'package:portfolio/widgets/typing_text.dart';
import 'package:portfolio/widgets/what.dart';
import 'package:portfolio/widgets/who.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioHomeDesktop extends StatefulWidget {
  @override
  _PortfolioHomeDesktopState createState() => _PortfolioHomeDesktopState();
}

class _PortfolioHomeDesktopState extends State<PortfolioHomeDesktop> with SingleTickerProviderStateMixin{
  final ScrollController _scrollController = ScrollController();
  ScrollPhysics _physics = PageScrollPhysics();

  AnimationController _controller;
  Animation _bottomLinkOpacityAnimation;

  String _image;

  @override
  void initState() {
    _controller = AnimationController(duration: Duration(milliseconds: 250), vsync: this);
    _bottomLinkOpacityAnimation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset >= MediaQuery.of(context).size.height) {
          _controller.forward();
        } else {
          _image = null;
          _controller.reverse();
        }
        if (_scrollController.offset >=
            MediaQuery.of(context).size.height * 1.4) {
          _physics = ClampingScrollPhysics();
        } else if (_scrollController.offset <
            MediaQuery.of(context).size.height * 1.4) {
          _physics = PageScrollPhysics();
        }
        if (_scrollController.offset >= MediaQuery.of(context).size.height &&
            _scrollController.offset <
                MediaQuery.of(context).size.height * 1.5) {
          _image = 'assets/images/3d-man-superhero.gif';
        } else if (_scrollController.offset >=
                MediaQuery.of(context).size.height * 1.5 &&
            _scrollController.offset <
                MediaQuery.of(context).size.height * 2.5) {
          _image = 'assets/images/3d-man-talking.gif';
        }
      });
    });
    _bottomLinkOpacityAnimation.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.all(0.0),
          physics: _physics,
          controller: _scrollController,
          child: Column(
            children: [
              Container(
                height: mediaQuery.size.height,
                width: mediaQuery.size.width,
                color: MyColors.color16,
                child: Stack(
                  children: [
                    Positioned(
                        top: mediaQuery.size.height * 0.7,
                        child: Container(
                            decoration: BoxDecoration(boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: mediaQuery.size.height * 0.2,
                                  spreadRadius: mediaQuery.size.height * 0.05)
                            ]),
                            height: 2.0,
                            width: mediaQuery.size.width * 1.5)),
                    Positioned(
                      left: mediaQuery.size.width * 0.5 - 12.0,
                      bottom: mediaQuery.size.height * 0.025,
                      child: Icon(Icons.keyboard_arrow_down,
                          color: Colors.white, size: 24.0),
                    ),
                    Center(
                      child: TypingText('Abhishek Upmanyu.',
                          style: TextStyle(
                              shadows: <Shadow>[
                                Shadow(
                                    color: MyColors.color18,
                                    offset: Offset(5.0, 5.0))
                              ],
                              fontSize: 86.0,
                              decoration: TextDecoration.none,
                              color: MyColors.color17,
                              fontFamily: 'Oswald')),
                    ),
                  ],
                ),
              ),
              Who(),
              What(),
              Container(
                height: mediaQuery.size.height,
                width: mediaQuery.size.width,
                color: MyColors.color18,
              ),
            ],
          ),
        ),
        Navbar(
          offset: _scrollController.hasClients ? _scrollController.offset : 0.0,
          who: () => _scrollController.animateTo(mediaQuery.size.height * 1.25,
              duration: Duration(milliseconds: 500), curve: Curves.decelerate),
        ),
        Positioned(
          left: mediaQuery.size.width/2-75.0,
          bottom: 20.0,
          child: Opacity(
            opacity: _bottomLinkOpacityAnimation.value,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () =>
                        launch('https://github.com/abhishekUpmanyu'),
                    child: Image.asset(
                        'assets/images/github-icon.png',
                        width: 30.0,
                        color: Colors.white)),
                Padding(padding: EdgeInsets.only(right: 30.0)),
                GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => launch(
                        'https://www.instagram.com/abhishekupmanyu_'),
                    child: Image.asset(
                        'assets/images/instagram-icon.png',
                        width: 30.0,
                        color: Colors.white)),
                Padding(padding: EdgeInsets.only(right: 30.0)),
                GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => launch(
                        'https://www.linkedin.com/in/abhishekupmanyu'),
                    child: Image.asset(
                        'assets/images/linkedin-icon.png',
                        width: 30.0,
                        color: Colors.white)),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: mediaQuery.size.height*0.5,
          left: mediaQuery.size.width/6,
          child: Stack(
            children: [
              Center(
                child: Image.asset('assets/images/speech-bubble.png',
                    width: mediaQuery.size.width / 6),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(mediaQuery.size.width / 40),
                  child: Text('Hi there,\naverage person \n\n\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        shadows: [
                          Shadow(color: MyColors.color17, offset: Offset(2.0, 2.0))
                        ],
                        fontFamily: 'Bangers',
                        fontSize: mediaQuery.size.width / 40,
                        decoration: TextDecoration.none,
                      )),
                ),
              )
            ],
          ),
        ),
        _image == null
            ? Container()
            : Positioned(
                left: -50,
                bottom: 0,
                child: Image.asset(_image, width: mediaQuery.size.width / 3))
      ],
    );
  }
}
