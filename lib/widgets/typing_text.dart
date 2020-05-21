import 'dart:math';

import 'package:flutter/material.dart';

class TypingText extends StatefulWidget {
  final String text;
  final TextStyle style;


  const TypingText(this.text, {Key key, this.style}) : super(key: key);
  @override
  _TypingTextState createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> {
  String _typedText = '';

  @override
  void initState() {
    _typeText();
    super.initState();
  }

  Future<Null> _typeText() async {
    for (var i=0; i<widget.text.length; ++i) {
      await Future.delayed(Duration(milliseconds: 75+Random().nextInt(50)), () {
        setState(() {
          _typedText+=widget.text[i];
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(_typedText,
        textAlign: TextAlign.center,
        style: widget.style);
  }
}
