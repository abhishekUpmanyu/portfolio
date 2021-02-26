import 'package:flutter/material.dart';

class PopupImageSlider extends StatefulWidget {
  final List<String> _images;

  const PopupImageSlider(this._images);
  @override
  _PopupImageSliderState createState() => _PopupImageSliderState();
}

class _PopupImageSliderState extends State<PopupImageSlider> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
      height: mediaQuery.size.height,
      width: mediaQuery.size.width,
      color: Colors.black38,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              IconButton(icon: Icon(Icons.chevron_left), onPressed: () {}),
              Expanded(child: Image.asset(widget._images[index])),
              IconButton(icon: Icon(Icons.chevron_right), onPressed: () {})
            ],
          ),
        )
      ),
    );
  }
}
