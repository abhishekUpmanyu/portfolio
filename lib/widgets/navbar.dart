import 'package:flutter/material.dart';
import 'package:portfolio/utils/my_colors.dart';

class Navbar extends StatefulWidget {
  final VoidCallback who;
  final VoidCallback what;
  final VoidCallback how;
  final double offset;

  const Navbar({Key key, this.who, this.what, this.how, this.offset})
      : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  Widget _navItem(String text, TextStyle style, VoidCallback onTap) {
    return Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Text(text,
              textAlign: TextAlign.center,
              style: style),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    print(mediaQuery.size.height);
    return Positioned(
      top: widget.offset<mediaQuery.size.height?mediaQuery.size.height * 0.05:mediaQuery.size.height * 0.25,
      left: widget.offset<mediaQuery.size.height?mediaQuery.size.width * 0.25: mediaQuery.size.width*0.95,
      child: widget.offset<mediaQuery.size.height?SizedBox(
        width: mediaQuery.size.width * 0.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _navItem('WHO', TextStyle(
                fontFamily: 'Nunito Sans',
                fontWeight: (widget.offset>=mediaQuery.size.height&&widget.offset<mediaQuery.size.height*3)?FontWeight.w500:FontWeight.w200,
                fontSize: 14.0,
                decoration: TextDecoration.none,
                color: Colors.white), widget.who),
            _navItem('WHAT', TextStyle(
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w200,
                fontSize: 14.0,
                decoration: TextDecoration.none,
                color: Colors.white), widget.what),
            _navItem('HOW', TextStyle(
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w200,
                fontSize: 14.0,
                decoration: TextDecoration.none,
                color: Colors.white), widget.how)
          ],
        ),
      ):SizedBox(
        height: mediaQuery.size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _navItem('WHO', TextStyle(
                fontFamily: 'Nunito Sans',
                fontWeight: (widget.offset>=mediaQuery.size.height&&widget.offset<mediaQuery.size.height*3)?FontWeight.w500:FontWeight.w100,
                fontSize: 14.0,
                decoration: TextDecoration.none,
                color: Colors.white), widget.who),
            _navItem('WHAT', TextStyle(
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w100,
                fontSize: 14.0,
                decoration: TextDecoration.none,
                color: Colors.white), widget.what),
            _navItem('HOW', TextStyle(
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w100,
                fontSize: 14.0,
                decoration: TextDecoration.none,
                color: Colors.white), widget.how)
          ],
        ),
      ),
    );
  }
}
